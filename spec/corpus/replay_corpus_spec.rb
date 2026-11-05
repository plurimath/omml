# frozen_string_literal: true

require "digest"
require "fileutils"
require "json"
require "stringio"
require "tmpdir"
require "yaml"
require_relative "../../scripts/replay_corpus"

# scripts/replay_corpus.rb --testsuite: the pin checks and the
# model-roundtrip replay, against a small testsuite checkout built in a
# temporary git repository.
RSpec.describe "scripts/replay_corpus.rb" do # rubocop:disable RSpec/DescribeClass
  def corpus
    OmmlReplayCorpus
  end

  def pin_file
    File.expand_path("../fixtures/testsuite-pin.yml", __dir__)
  end

  def omml(text)
    '<m:oMathPara xmlns:m="http://schemas.openxmlformats.org/' \
      'officeDocument/2006/math"><m:oMath><m:r>' \
      "<m:t>#{text}</m:t></m:r></m:oMath></m:oMathPara>"
  end

  let(:inputs) { [omml("a"), omml("x")] }
  let(:rows) do
    inputs.each_with_index.map do |input, i|
      { "id" => "row-#{i}.model-roundtrip", "input" => { "str" => input },
        "options" => {}, "expected" => corpus.outcome(input) }
    end
  end

  def gen_path
    "stages/omml/generations/000001"
  end

  # The generation's payloads: a facade-output payload, which the replay
  # skips, and a model-roundtrip payload of +cases+.
  def sample_payloads(cases)
    {
      "payloads/sample.yaml" => YAML.dump(
        "schema" => "plurimath-corpus/omml/1", "group" => "sample",
        "cases" => [{ "id" => "sample-001", "input" => "x" }]
      ),
      "payloads/model-roundtrip-sample.yaml" => YAML.dump(
        "schema" => "plurimath-stage/omml/cases/1",
        "group" => "model-roundtrip-sample",
        "boundary" => "model-roundtrip", "cases" => cases
      ),
    }
  end

  def provenance_for(payloads)
    YAML.dump(
      "schema" => "plurimath-stage/provenance/1", "language" => "omml",
      "generation" => 1,
      "payloads" => payloads.sort.map do |path, bytes|
        { "path" => path, "sha256" => Digest::SHA256.hexdigest(bytes) }
      end
    )
  end

  # Writes the generation's files under +dir+; returns its snapshot digest.
  def write_generation(dir, cases)
    gen = File.join(dir, gen_path)
    FileUtils.mkdir_p(File.join(gen, "payloads"))
    payloads = sample_payloads(cases)
    payloads.each { |path, bytes| File.binwrite(File.join(gen, path), bytes) }
    provenance = provenance_for(payloads)
    File.binwrite(File.join(gen, "provenance.yaml"), provenance)
    corpus.snapshot_digest(payloads.merge("provenance.yaml" => provenance))
  end

  def write_ledger(dir, digest)
    FileUtils.mkdir_p(File.join(dir, "generations"))
    ledger = { "schema" => "plurimath-stage/ledger/1", "language" => "omml",
               "layout" => 1,
               "entries" => [{ "generation" => 1, "path" => gen_path,
                               "snapshot_digest" => digest }] }
    File.binwrite(File.join(dir, "generations/omml.yaml"), YAML.dump(ledger))
  end

  # A testsuite checkout with one omml generation of +cases+.
  # Returns [commit, snapshot digest].
  def build_testsuite(dir, cases)
    digest = write_generation(dir, cases)
    write_ledger(dir, digest)
    git = ["git", "-C", dir, "-c", "user.name=t", "-c",
           "user.email=t@example.com"]
    system("git", "init", "-q", dir, exception: true)
    system(*git, "add", ".", exception: true)
    system(*git, "commit", "-qm", "t", exception: true)
    [corpus.git(dir, "rev-parse", "HEAD"), digest]
  end

  def write_pin(path, **fields)
    pin = { "schema" => "plurimath-stage/pin/1",
            "repository" => "https://github.com/plurimath/plurimath-testsuite",
            "commit" => nil, "language" => "omml", "generation" => 1,
            "snapshot_digest" => nil }
    File.binwrite(path,
                  YAML.dump(pin.merge(fields.transform_keys(&:to_s)).compact))
    path
  end

  def run_replay(testsuite, pin, **options)
    corpus.run(testsuite: testsuite, pin: pin, log: StringIO.new,
               **options)
  end

  def with_testsuite(cases = rows)
    Dir.mktmpdir do |dir|
      testsuite = File.join(dir, "testsuite")
      commit, digest = build_testsuite(testsuite, cases)
      yield dir, testsuite, commit, digest
    end
  end

  describe "the committed pin" do
    it "names omml generation 2 at an exact testsuite commit" do
      expect(corpus.load_pin(pin_file)).to have_attributes(
        language: "omml", generation: 2, commit: match(/\A\h{40}\z/),
        digest: match(/\Asha256:\h{64}\z/)
      )
    end
  end

  describe ".load_pin" do
    let(:good) { { commit: "a" * 40, snapshot_digest: "sha256:#{'0' * 64}" } }
    let(:malformed) do
      {
        "schema" => { schema: "plurimath-stage/pin/2" },
        "repository" => {
          repository: "https://github.com/plurimath/plurimath",
        },
        "commit" => { commit: "337262e" },
        "language" => { language: "latex" },
        "generation" => { generation: 0 },
        "snapshot_digest" => { snapshot_digest: "53943ace" },
        "missing" => { snapshot_digest: nil },
      }
    end

    it "loads a well-formed pin" do
      Dir.mktmpdir do |dir|
        pin = write_pin(File.join(dir, "ok.yml"), **good)
        expect(corpus.load_pin(pin).generation).to eq(1)
      end
    end

    it "refuses a pin with a missing or malformed field" do
      Dir.mktmpdir do |dir|
        malformed.each do |name, change|
          path = write_pin(File.join(dir, "#{name}.yml"), **good, **change)
          expect { corpus.load_pin(path) }
            .to raise_error(corpus::Error), name
        end
      end
    end

    it "refuses a pin with an unknown field" do
      Dir.mktmpdir do |dir|
        ok = YAML.load_file(write_pin(File.join(dir, "ok.yml"), **good))
        File.binwrite(File.join(dir, "extra.yml"),
                      YAML.dump(ok.merge("x" => 1)))
        expect { corpus.load_pin(File.join(dir, "extra.yml")) }
          .to raise_error(corpus::Error, /unknown keys x/)
      end
    end
  end

  describe ".run" do
    it "replays every model-roundtrip row and skips " \
       "other payloads when the pin matches" do
      with_testsuite do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: commit, snapshot_digest: digest)
        summary = run_replay(testsuite, pin, language: "omml", generation: 1)
        expect(summary.values_at("model-roundtrip_payloads",
                                 "model-roundtrip_rows", "skipped_payloads",
                                 "mismatched_rows")).to eq([1, 2, 1, 0])
      end
    end

    it "fails when the pinned commit is not the checkout's HEAD" do
      with_testsuite do |dir, testsuite, _commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: "0" * 40, snapshot_digest: digest)
        expect do
          run_replay(testsuite,
                     pin)
        end.to raise_error(corpus::Error, /is not the checkout's HEAD/)
      end
    end

    it "fails when the pinned digest is not the generation's" do
      with_testsuite do |dir, testsuite, commit, _digest|
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: commit, snapshot_digest: "sha256:#{'0' * 64}")
        expect do
          run_replay(testsuite,
                     pin)
        end.to raise_error(corpus::Error,
                           /is not the expected sha256:0{64}/)
      end
    end

    it "fails when a committed generation file " \
       "no longer matches the ledger digest" do
      with_testsuite do |dir, testsuite, commit, digest|
        File.binwrite(File.join(testsuite, gen_path, "payloads/sample.yaml"),
                      "x\n", mode: "ab")
        system("git", "-C", testsuite, "-c", "user.name=t",
               "-c", "user.email=t@example.com",
               "commit", "-qam", "tamper", exception: true)
        head = corpus.git(testsuite, "rev-parse", "HEAD")
        expect(head).not_to eq(commit)
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: head, snapshot_digest: digest)
        expect do
          run_replay(testsuite,
                     pin)
        end.to raise_error(corpus::Error,
                           /does not match the ledger's/)
      end
    end

    it "fails when the checkout has uncommitted stage files" do
      with_testsuite do |dir, testsuite, commit, digest|
        File.binwrite(File.join(testsuite, gen_path, "payloads/sample.yaml"),
                      "x\n", mode: "ab")
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: commit, snapshot_digest: digest)
        expect do
          run_replay(testsuite,
                     pin)
        end.to raise_error(corpus::Error, /uncommitted stage files/)
      end
    end

    it "fails when the pinned generation is not in the ledger" do
      with_testsuite do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: commit, generation: 2, snapshot_digest: digest)
        expect do
          run_replay(testsuite,
                     pin)
        end.to raise_error(corpus::Error, /has no generation 2/)
      end
    end

    it "fails when the caller expects another " \
       "generation or language than the pin's" do
      with_testsuite do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: commit, snapshot_digest: digest)
        expect { run_replay(testsuite, pin, generation: 2) }
          .to raise_error(corpus::Error,
                          /--generation 2 is not the pinned 1/)
        expect { run_replay(testsuite, pin, language: "latex") }
          .to raise_error(corpus::Error,
                          /--language latex is not the pinned omml/)
      end
    end

    it "fails and reports the row when " \
       "an outcome differs from the expected value" do
      changed = rows.dup
      changed[1] =
        changed[1].merge("expected" =>
                           Marshal.load(Marshal.dump(rows[0]["expected"])))
      with_testsuite(changed) do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: commit, snapshot_digest: digest)
        report = File.join(dir, "report.json")
        expect { run_replay(testsuite, pin, report: report) }
          .to raise_error(corpus::Error,
                          /1 rows differ: row-1\.model-roundtrip/)
        expect(JSON.parse(File.read(report)).fetch("failures").map do |f|
          f["id"]
        end).to eq(["row-1.model-roundtrip"])
      end
    end

    it "fails when the generation has no model-roundtrip rows" do
      with_testsuite([]) do |dir, testsuite, commit, digest|
        pin = write_pin(File.join(dir, "pin.yml"),
                        commit: commit, snapshot_digest: digest)
        expect do
          run_replay(testsuite,
                     pin)
        end.to raise_error(corpus::Error,
                           /has no model-roundtrip rows/)
      end
    end
  end
end

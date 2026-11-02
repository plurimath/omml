# 04 — Convert `require_relative` chains to `autoload`

## What

Three files use `require_relative` for internal library code:

- `lib/omml/models.rb` (176 declarations)
- `lib/omml/models/simple_types.rb` (57 declarations)
- `lib/omml/models/groups.rb` (16 declarations)

Convert each to `autoload` declarations in the parent namespace's file.

Pattern:

```ruby
# lib/omml/models.rb
module Omml
  module Models
    autoload :Base, "omml/models/base"
    autoload :EnumString, "omml/models/simple_types/enum_string"
    autoload :CTAcc, "omml/models/ct_acc"
    # ...

    def self.eager_load!
      constants.each { |name| const_get(name) }
    end
  end
end
```

`populate_context!` calls `Omml::Models.eager_load!` to trigger every
file load → class definition → auto-registration via `inherited`.

## Why

- Per global rule: "NEVER use `require_relative` for internal library code"
- Lazy loading: programmatic consumers can use individual models without
  pulling in the entire 250-file tree
- Cleaner load path
- Removes Opal boot file's special-casing of `models.rb`

## Sub-module structure

- `lib/omml/models/simple_types.rb` becomes the parent for `ST*` autoloads
- `lib/omml/models/groups.rb` becomes the parent for `EG*` autoloads
- Each is itself autoloaded from `lib/omml/models.rb`

## Verification

- `bundle exec rspec` — all 306 examples pass
- `bundle exec ruby -e "require 'omml'; Omml::Models::CTAcc"` — lazy loads single file
- `Omml::Configuration.populate_context!` triggers full registration

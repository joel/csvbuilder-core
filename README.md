# Csvbuilder::Core

[Csvbuilder::Core](https://github.com/joel/csvbuilder-core) is part of the [csvbuilder-collection](https://github.com/joel/csvbuilder)

The core contains the shared components used and extended by the exporter and the importer. It is the foundation of the gem [csvbuilder](https://github.com/joel/csvbuilder) and carries the library's architecture, and it is not meant to be used alone.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add csvbuilder-core

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install csvbuilder-core

# Architecture

It is organized into three sections, the public, internal and mixins.

<img width="215" alt="Screenshot 2022-12-28 at 12 53 59 PM" src="https://user-images.githubusercontent.com/5789/209835572-01d1a7e5-3175-490c-a166-1b9b74908390.png">

# Public

The public exposes the API meant to be used by the other components. The concrete implementation is mainly lying in the Mixins, though.

# Base Attributes

It represents a `CSV` row in `Csvbuilder`. At the core, it defines the standard behaviour, and those behaviours are specialized in `Export` and `Import` gems.

In `core/concerns/attributes_base`, it exposes three main methods:

1. `original_attributes`
2. `formatted_attributes`
3. `source_attributes`

Those methods are collections called on `Attribute`—for instance, `original_attributes` call `Attribute#value` under the hood for the current row.

# Model Attributes

In `core/concerns/model/attributes`, we can find the DSL where columns with the options are defined and stored.

```ruby
class BasicRowModel
  include Csvbuilder::Model

  column :alpha
  column :beta
end
```

It also carries the headers and the two methods helping with the formatting.

```ruby
class BasicRowModel
  include Csvbuilder::Model

  class << self

    # Used by Csvbuilder::AttributeBase#formatted_value
    def format_cell(value, column_name, context)
      "- || * #{column_name} * || -"
    end

    # Used by Csvbuilder::Model::Header#formatted_header
    def format_header(column_name, context)
      "~ #{column_name} ~"
    end
  end
end

header = "Alpha"
value  = "alpha one"

AttributeBase.new.formatted_value
# => "- || * alpha one * || -"

Header.new.formatted_header
# => ~ Alpha ~
```

Internally calling respectively:

```ruby
module Csvbuilder
  module Model
    class Header

      def formatted_header
        row_model_class.format_header(column_name, context)
      end

    end
  end
end

```

and

```ruby
module Csvbuilder
  class AttributeBase

    def formatted_value
      @formatted_value ||= row_model_class.format_cell(source_value, column_name, row_model.context)
    end

  end
end

```

# Attribute

Represent the cell value.

Can be found here: `core/internal/attribute_base`.

It can represent the value through the three following methods:

1.  `source_value` unchanged value
2.  `value` often the formatted_value, but some logic can be added.
3.  `formatted_value`

<img width="725" alt="Screenshot 2022-12-28 at 3 23 34 PM" src="https://user-images.githubusercontent.com/5789/209835649-373ebaad-ed53-420d-8a7a-1b93c782d066.png">

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joel/csvbuilder-core. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/csvbuilder-core/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Csvbuilder::Core project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/csvbuilder-core/blob/main/CODE_OF_CONDUCT.md).

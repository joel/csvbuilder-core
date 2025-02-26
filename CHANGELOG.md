## [Unreleased]

## [0.1.4] - 2025-02-26

- Adding Csvbuilder::Model::Attributes#column_header by [Michael Keene](https://github.com/Michaelkeene)

## [0.1.3] - 2023-03-03

Add Header default formatting

```ruby
class BasicRowModel
  include Csvbuilder::Model

  column :alpha
end

BasicRowModel.headers
# => ["Alpha"]
```

Basic Proc Capability

```ruby
class BasicRowModel
  include Csvbuilder::Model

  column :alpha, header: ->(column_name, context) { "#{context.inspect} #{column_name.to_s.humanize}" }
end

BasicRowModel.headers({ foo: :bar }) }
# => ["#<OpenStruct foo=:bar> Alpha"] }
```

## [0.1.0] - 2022-12-15

- Initial release

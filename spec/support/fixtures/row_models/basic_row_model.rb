# frozen_string_literal: true

class BasicRowModel
  include Csvbuilder::Model

  column :alpha
  column :beta, header: "Beta Two"
  column :gamma, header: ->(column_name, context) { "#{context.inspect} #{column_name.to_s.humanize}" }
end

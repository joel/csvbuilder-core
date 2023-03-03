# frozen_string_literal: true

require "csvbuilder/core/internal/concerns/column_shared"

module Csvbuilder
  module Model
    class Header
      include ColumnShared

      attr_reader :column_name, :row_model_class, :context

      def initialize(column_name, row_model_class, context)
        @column_name     = column_name
        @row_model_class = row_model_class
        @context         = OpenStruct.new(context)
      end

      def value
        case options[:header]
        when Proc
          return options[:header].call(column_name, context)
        when String
          return options[:header]
        end

        formatted_header(column_name.to_s.humanize)
      end

      def formatted_header(header_name)
        row_model_class.format_header(header_name, context)
      end
    end
  end
end

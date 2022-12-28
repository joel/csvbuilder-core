# frozen_string_literal: true

require "csvbuilder/core/internal/concerns/column_shared"

module Csvbuilder
  class AttributeBase
    include ColumnShared

    attr_reader :column_name, :row_model

    def initialize(column_name, row_model)
      @column_name = column_name
      @row_model   = row_model
    end

    # @return [Object] the value with formatting applied
    def formatted_value
      @formatted_value ||= row_model_class.format_cell(source_value, column_name, row_model.context)
    end

    # @return [Object] the value
    def value
      raise NotImplementedError
    end

    # @return [Object] the unchanged value from the source
    def source_value
      raise NotImplementedError
    end

    protected

    def row_model_class
      row_model.class
    end
  end
end

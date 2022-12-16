# frozen_string_literal: true

require "csvbuilder/core/concerns/model/base"
require "csvbuilder/core/concerns/model/attributes"

module Csvbuilder
  module Model
    extend ActiveSupport::Concern

    include Base
    include Attributes
  end
end

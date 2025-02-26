# frozen_string_literal: true

module Csvbuilder
  module Proxy
    extend ActiveSupport::Concern

    class_methods do
      def proxy
        @proxy ||= Module.new.tap { |mod| include mod }
      end

      def define_proxy_method(*, &)
        proxy.send(:define_method, *, &)
      end
    end
  end
end

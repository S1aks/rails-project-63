# frozen_string_literal: true

module HexletCode
  # Class for render textarea form field
  class TextArea
    DEFAULT_ATTRIBUTES = { cols: '20', rows: '40' }.freeze

    def initialize(name, value, **attributes)
      @value = value
      @attributes = { tab: 1, name: name }.merge(DEFAULT_ATTRIBUTES, attributes)
    end

    def render
      Tag.build 'textarea', @attributes do
        @value
      end
    end
  end
end

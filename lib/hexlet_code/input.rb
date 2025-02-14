# frozen_string_literal: true

module HexletCode
  # Class for render text input form field
  class Input
    DEFAULT_ATTRIBUTES = { type: 'text' }.freeze

    def initialize(name, value, attributes)
      @attributes = { name: name, tab: 1 }.merge(DEFAULT_ATTRIBUTES, { value: value }, attributes)
    end

    def render
      Tag.build 'input', @attributes
    end
  end
end

# frozen_string_literal: true

module HexletCode
  # Class for render form submit button
  class Submit
    DEFAULT_ATTRIBUTES = { type: 'submit' }.freeze

    def initialize(_, value, attributes)
      @attributes = { tab: 1 }.merge(DEFAULT_ATTRIBUTES, { value: value }, attributes)
    end

    def render
      Tag.build 'input', @attributes
    end
  end
end

# frozen_string_literal: true

module HexletCode
  # Class for render form submit button
  class SubmitButton
    DEFAULT_ATTRIBUTES = { type: 'submit' }.freeze

    def initialize(value, **attributes)
      @attributes = { tab: 1 }.merge(DEFAULT_ATTRIBUTES, { value: value }, attributes)
    end

    def render
      Tag.build 'input', @attributes
    end
  end
end

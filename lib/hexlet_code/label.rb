# frozen_string_literal: true

module HexletCode
  # Class for render label form field
  class Label
    def initialize(name, **attributes)
      @attributes = { tab: 1, for: name }.merge(attributes)
      @text = name.to_s.split('_').map(&:capitalize).join(' ')
    end

    def render
      Tag.build 'label', @attributes do
        @text
      end
    end
  end
end

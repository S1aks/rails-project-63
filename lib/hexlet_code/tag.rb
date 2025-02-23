# frozen_string_literal: true

module HexletCode
  # Tag generator class
  class Tag
    SINGLE_TAGS = %w[!doctype area base br col embed hr img input link meta source track wbr].freeze

    def self.build(name, attributes)
      result = []
      attributes.fetch(:tab, 0).times { result << '  ' }
      result << "<#{name}#{attr_line(attributes)}>"
      unless SINGLE_TAGS.include?(name)
        result << "\n" if name == 'form'
        result << yield
        result << "\n" if name == 'form'
        result << "</#{name}>"
      end
      result.join
    end

    def self.attr_line(attributes)
      attributes.except(:tab).map { |key, value| key == :disabled ? " #{key}" : " #{key}=\"#{value}\"" }.join
    end
  end
end

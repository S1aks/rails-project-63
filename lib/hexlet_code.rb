# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  # Tag generator class
  class Tag
    def self.build(name, attr = {})
      result = []
      result << "<#{name}"
      attr.each do |key, value|
        result << " #{key}=\"#{value}\""
      end
      result << '>'
      result << yield.to_s if block_given?
      result << "</#{name}>" unless single(name)
      result.join
    end

    def self.single(name)
      %w[!doctype area base br col embed hr img input link meta source track wbr].include?(name)
    end
  end
end

# frozen_string_literal: true

# Module for generate html form
module HexletCode
  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :Tag, 'hexlet_code/tag'
  autoload :VERSION, 'hexlet_code/version'

  class Error < StandardError; end

  def self.form_for(object, **options, &block)
    builder = FormBuilder.new(object)
    block.call(builder) if block_given?
    Tag.build 'form', options.merge(action: options.fetch(:url, '#'), method: 'post').except(:url) do
      builder.fields.join("\n")
    end
  end
end

# frozen_string_literal: true

# Module for generate markup form
module HexletCode
  autoload :FieldsBuilder, 'hexlet_code/fields_builder'
  autoload :Tag, 'hexlet_code/tag'
  autoload :VERSION, 'hexlet_code/version'

  class Error < StandardError; end

  def self.form_for(object, **options, &block)
    builder = FieldsBuilder.new(object)
    block.call(builder) if block_given?
    render_name = options.fetch(:render_type, :html).to_s
    render_class_name = "#{render_name.capitalize}Render"
    render_class_path = "hexlet_code/#{render_name}_render"
    render_class = get_class render_class_name, render_class_path
    render_class.render options.except(:render_type), builder.fields
  end

  def self.get_class(class_name, path)
    autoload class_name.to_sym, path
    const_get class_name
  end
end

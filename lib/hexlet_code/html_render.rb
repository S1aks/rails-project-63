# frozen_string_literal: true

module HexletCode
  # Class for render html markup
  class HtmlRender
    def self.render(options, fields)
      form_options = {
        action: options.fetch(:url, '#'),
        method: 'post'
      }.merge(options).except(:url)
      Tag.build 'form', form_options do
        form_fields = fields.map(&HtmlRender.method(:field_render))
        form_fields.join("\n")
      end
    end

    def self.field_render(field)
      class_name = field[:field_type].to_s.capitalize
      class_path = "hexlet_code/#{field[:field_type]}"
      field_class = HexletCode.get_class class_name, class_path
      field_class.new(field[:name], field[:value], field.except(:field_type, :name, :value)).render
    end
  end
end

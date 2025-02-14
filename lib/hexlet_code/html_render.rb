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
        form_fields = fields.map do |field|
          field_render(field)
        end
        form_fields.join("\n")
      end
    end

    def self.field_render(field)
      class_name = field[:ftype].to_s.capitalize
      class_path = "hexlet_code/#{field[:ftype]}"
      field_class = HexletCode.get_class class_name, class_path
      field_class.new(field[:name], field[:value], field.except(:ftype, :name, :value)).render
    end
  end
end

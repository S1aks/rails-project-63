# frozen_string_literal: true

# Module for generate html form
module HexletCode
  # Load form fields classes
  autoload :TextInput, 'hexlet_code/text_input'
  autoload :TextArea, 'hexlet_code/text_area'

  # Form builder class
  class FormBuilder
    attr_reader :inputs

    def initialize(object)
      @object = object
      @inputs = []
    end

    def input(name, as: :input, **attributes)
      raise NoMethodError, "undefined method `#{name}' for #{@object.inspect}" unless @object.respond_to?(name)

      value = @object.public_send(name)
      input_class = case as # Define rendered class
                    when :input
                      TextInput
                    when :text
                      TextArea
                    end
      input_instance = input_class.new(name, value, **attributes)
      @inputs << input_instance.render
    end
  end
end

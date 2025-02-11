# frozen_string_literal: true

# Module for generate html form
module HexletCode
  # Load form fields classes
  autoload :Label, 'hexlet_code/label'
  autoload :SubmitButton, 'hexlet_code/submit_button'
  autoload :TextArea, 'hexlet_code/text_area'
  autoload :TextInput, 'hexlet_code/text_input'

  # Form builder class
  class FormBuilder
    attr_reader :fields

    def initialize(object)
      @object = object
      @fields = []
    end

    def input(name, as: :input, **attributes)
      raise NoMethodError, "undefined method '#{name}' for #{@object.inspect}" unless @object.respond_to?(name)

      value = @object.public_send(name)
      add_label(name)
      input_instance = get_class(as).new(name, value, **attributes)
      @fields << input_instance.render
    end

    def submit(value = 'Save', **attributes)
      button = SubmitButton.new(value, **attributes)
      @fields << button.render
    end

    private

    def add_label(name)
      label = Label.new(name)
      @fields << label.render
    end

    def get_class(name)
      case name
      when :input
        TextInput
      when :text
        TextArea
      else
        raise Error, "functionality field with name '#{name}' is not defined!"
      end
    end
  end
end

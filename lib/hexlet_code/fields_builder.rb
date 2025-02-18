# frozen_string_literal: true

module HexletCode
  # Fields builder class
  class FieldsBuilder
    attr_reader :fields

    def initialize(object)
      @object = object
      @fields = []
    end

    def input(name, as: :input, **attributes)
      value = @object.public_send(name)
      label_present = attributes.fetch(:label_present, true)
      attributes.delete(:label_present)
      @fields << { field_type: :label, name: name } if label_present
      @fields << { field_type: as, name: name, value: value }.merge(attributes)
    end

    def submit(value = 'Save', **attributes)
      @fields << { field_type: :submit, value: value }.merge(attributes)
    end
  end
end

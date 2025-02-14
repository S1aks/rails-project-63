# frozen_string_literal: true

module HexletCode
  # Form builder class
  class FieldsBuilder
    attr_reader :fields

    def initialize(object)
      @object = object
      @fields = []
    end

    def input(name, as: :input, **attributes)
      value = @object.public_send(name)
      @fields << { ftype: :label, name: name }
      @fields << { ftype: as, name: name, value: value }.merge(attributes)
    end

    def submit(value = 'Save', **attributes)
      @fields << { ftype: :submit, value: value }.merge(attributes)
    end
  end
end

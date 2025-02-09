# frozen_string_literal: true

# Module for generate html form
module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :VERSION, 'hexlet_code/version'

  class Error < StandardError; end

  def self.form_for(_obj = nil, options = {})
    build_options = { action: options.fetch(:url, '#'), method: 'post' }.merge(options.except(:url))
    Tag.build('form', build_options)
  end
end

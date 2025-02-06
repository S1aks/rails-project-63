# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_build_br
    input = 'br'
    output = '<br>'
    assert_equal output, HexletCode::Tag.build(input)
  end
  
  def test_build_image
    input_name = 'img'
    input_attr = {src: 'path/to/image'}
    output = '<img src="path/to/image">'
    assert_equal output, HexletCode::Tag.build(input_name, input_attr)
  end

  def test_build_input
    input_name = 'input'
    input_attr = {type: 'submit', value: 'Save'}
    output = '<input type="submit" value="Save">'
    assert_equal output, HexletCode::Tag.build(input_name, input_attr)
  end

  def test_build_label
    input_name = 'label'
    input_str = 'Email'
    output = '<label>Email</label>'
    assert_equal output, HexletCode::Tag.build(input_name) { input_str }
  end

  def test_build_label_for
    input_name = 'label'
    input_attr = {for: 'email'}
    input_str = 'Email'
    output = '<label for="email">Email</label>'
    assert_equal output, HexletCode::Tag.build(input_name, input_attr) { input_str }
  end

  def test_build_empty_div
    input_name = 'div'
    output = '<div></div>'
    assert_equal output, HexletCode::Tag.build(input_name)
  end
end

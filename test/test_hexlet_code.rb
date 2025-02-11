# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new(name: 'rob', job: 'hexlet', gender: 'm')
  end

  def read_fixture(filename)
    File.read(File.join(__dir__, 'fixtures', filename)).strip
  end

  def test_form_build_with_textinput_and_textarea
    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected_form = read_fixture('form_with_textinput_and_textarea.html')

    assert_equal expected_form, form
  end

  def test_form_build_with_default_values
    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    expected_form = read_fixture('form_with_default_values.html')

    assert_equal expected_form, form
  end

  def test_form_build_with_custom_attributes
    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected_form = read_fixture('form_with_custom_attributes.html')

    assert_equal expected_form, form
  end

  def test_error_for_non_existent_field
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age # wrong field
      end
    end
  end
end

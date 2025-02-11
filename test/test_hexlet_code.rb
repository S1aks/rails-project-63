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

  def test_form_with_labels_and_submit
    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end

    expected_form = read_fixture('form_with_labels_and_submit.html')

    assert_equal expected_form, form
  end

  def test_custom_submit_text_and_attributes
    form = HexletCode.form_for(@user, url: '/profile') do |f|
      f.submit 'Update Profile', class: 'btn-primary', disabled: true
    end

    expected_form = read_fixture('custom_submit_text_and_attributes.html')

    assert_equal expected_form, form
  end

  def test_label_generation_rules
    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :name
      f.input :job, as: :text
    end

    expected_form = read_fixture('label_generation_rules.html')

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

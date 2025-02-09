# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)
  @user = User.new(name: 'rob')

  def test_gen_empty_form_without_attributes
    output = '<form action="#" method="post"></form>'

    assert_equal output, HexletCode.form_for(@user)
  end

  def test_gen_empty_form_with_class_attr
    output = '<form action="#" method="post" class="hexlet-form"></form>'

    assert_equal output, HexletCode.form_for(@user, class: 'hexlet-form')
  end

  def test_gen_empty_form_with_url_and_class_attr
    output = '<form action="/profile" method="post" class="hexlet-form"></form>'

    assert_equal output, HexletCode.form_for(@user, url: '/profile', class: 'hexlet-form')
  end
end

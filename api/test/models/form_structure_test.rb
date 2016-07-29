require 'test_helper'

class FormStructureTest < ActiveSupport::TestCase
  fixtures :form_structures

  def test_valid_fixture
    f_str = FormStructure.find(form_structures(:f_str_valid).id)

    # 値のテスト
    assert f_str.valid?, f_str.errors.full_messages
    assert_equal f_str.structure_json, form_structures(:f_str_valid).structure_json

  end

  def test_invalid_json_fixture
    f_str = FormStructure.find(form_structures(:f_str_invalid_json).id)

    # 不正かだけテスト
    assert !f_str.valid?, ''
  end

end

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  fixtures :answers

  def test_valid_fixture
    ans = Answer.find(answers(:ans_valid).id)

    # 値のテスト
    assert ans.valid?, ans.errors.full_messages
    assert_equal ans.answer_json, answers(:ans_valid).answer_json
    assert_equal ans.form_structure_id, answers(:ans_valid).form_structure_id
  end

  def test_invalid_json_fixture
    ans = Answer.find(answers(:ans_invalid_json).id)

    # 不正かだけテスト
    assert !ans.valid?, ans.errors.full_messages
  end


end

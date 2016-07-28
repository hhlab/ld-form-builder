require 'test_helper'

class Api::V1::AnswerControllerTest < ActionController::TestCase
  fixtures :answers

  def setup
    @controller = Api::V1::AnswerController.new
  end

  test "routes to #index" do
    get :index
    assert_response :success
  end

  test "routes to #show" do
    get :show , params:{:id => answers(:ans_valid).id}
    assert_response :success
  end

  test "route to #show fail" do
    get :show , params:{:id => '１'}
    assert_response 400

    get :show , params:{:id => 'hoge'}
    assert_response 400
  end

  test "routes to #new" do
    get :new
    assert_response :success
  end

  test "routes to #create" do
    a = answers(:ans_valid)
    post :create , params:{:answer_json=>a.answer_json, :form_structure=>a.form_structure}

    assert_response :success
  end

end

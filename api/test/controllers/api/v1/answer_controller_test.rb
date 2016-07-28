require 'test_helper'

class Api::V1::AnswerControllerTest < ActionController::TestCase
  fixtures :answers

  def setup
    @controller = Api::V1::AnswerController.new
  end

  test "routes to ans#index" do
    get :index
    assert_response :success
  end

  test "routes to ans#show" do
    get :show , params:{:id => answers(:ans_valid).id}
    assert_response :success
  end

  test "route to ans#show fail" do
    get :show , params:{:id => '１'}
    assert_response 400

    get :show , params:{:id => 'hoge'}
    assert_response 400
  end

  test "routes to ans#new" do
    get :new
    assert_response :success
  end

  test "routes to ans#create" do
    a = answers(:ans_valid)
    post :create , params:{:answer_json=>a.answer_json, :form_structure=>a.form_structure_id}

    assert_response :success
  end

end

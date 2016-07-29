require 'test_helper'

class Api::V1::FormStructureControllerTest < ActionController::TestCase
  fixtures :form_structures

  def setup
    @controller = Api::V1::FormStructureController.new
  end

  test "routes to fs#index" do
    get :index
    assert_response :success
  end

  test "routes to fs#show" do
    get :show , params:{:id => form_structures(:f_str_valid).id}
    assert_response :success
  end

  test "route to fs#show fail" do
    get :show , params:{:id => '１'}
    assert_response 400

    get :show , params:{:id => 'hoge'}
    assert_response 400
  end

  test "routes to fs#new" do
    get :new
    assert_response :success
  end

  test "routes to fs#create" do
    s = form_structures(:f_str_valid)
    post :create , params:{:structure_json=>s.structure_json}

    assert_response :success
  end

end
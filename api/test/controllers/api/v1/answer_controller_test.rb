require 'test_helper'

class Api::V1::AnswerControllerTest < ActionController::TestCase
  fixtures :answers

  def setup
    @controller = Api::V1::ArticlesController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  # test "routes to #index" do
  #   get :index
  #   assert_response :success
  #
  #   #全ての記事が帰ってくるので検証
  #   json_request = JSON.parse(response.body)
  #   assert_equal json_request["response"][0]["title"], articles(:one).title
  #   assert_equal json_request["response"][0]["body"], articles(:one).body
  #   assert_equal json_request["response"][0]["author"], articles(:one).author
  #   assert_equal json_request["response"][1]["title"], articles(:two).title
  #   assert_equal json_request["response"][1]["body"], articles(:two).body
  #   assert_equal json_request["response"][1]["author"], articles(:two).author
  #
  # end
  #
  # test "routes to #show" do
  #   show_article = :one
  #
  #   get :show , {:id => articles(show_article).id}
  #   assert_response :success
  #
  #   #指定した記事が帰ってくるのでの検証
  #   json_request = JSON.parse(response.body)
  #   assert_equal json_request["response"]["id"], articles(show_article).id
  #   assert_equal json_request["response"]["title"], articles(show_article).title
  #   assert_equal json_request["response"]["body"], articles(show_article).body
  #   assert_equal json_request["response"]["author"], articles(show_article).author
  # end
  #
  # test "route to #show fail" do
  #   get :show , {:id => '１'}
  #   assert_response 400
  #
  #   get :show , {:id => 'hoge'}
  #   assert_response 400
  # end
  #
  # test "routes to #new" do
  #   new_article = :two
  #
  #   get :new
  #   assert_response :success
  #
  #   #一番最後に作成した記事が帰ってくるのでの検証
  #   json_request = JSON.parse(response.body)
  #   assert_equal json_request["response"]["id"], articles(new_article).id
  #   assert_equal json_request["response"]["title"], articles(new_article).title
  #   assert_equal json_request["response"]["body"], articles(new_article).body
  #   assert_equal json_request["response"]["author"], articles(new_article).author
  # end
  #
  # test "routes to #create" do
  #   create_artcle = {title: "title", body: "body", author: "author"}
  #
  #   post :create , create_artcle
  #   assert_response :success
  #
  #   #作成した記事が帰ってくるのでの検証
  #   json_request = JSON.parse(response.body)
  #   assert_equal json_request["response"]["title"], create_artcle[:title]
  #   assert_equal json_request["response"]["body"], create_artcle[:body]
  #   assert_equal json_request["response"]["author"], create_artcle[:author]
  # end

end

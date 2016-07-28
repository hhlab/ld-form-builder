class Api::V1::AnswerController < ApplicationController
  # テスト用にトークン認証を無効
  # TODO:環境変数等で切り替える

  def index
    begin
      @answers = Answer.all.reverse_order!
      @header ={
          :status => :ok,
          :errorCode => 200
      }
    rescue => e
      @answers = {}
      @header ={
          :status => e.message,
          :errorCode => 400
      }
    end
    render json: {:response => @answers, :header => @header}, :status => @header[:errorCode]
  end

  def show
    begin
      @answers = Answer.find_by!(id: params[:id])
      @header ={
          :status => :ok,
          :errorCode => 200
      }
    rescue => e
      @articles = {}
      @header ={
          :status => e.message,
          :errorCode => 400
      }
    end
    render json: {:response => @answers, :header => @header}, :status => @header[:errorCode]
  end

  def new
    begin
      @answers = Answer.first!
      @header ={
          :status => :ok,
          :errorCode => 200
      }
    rescue => e
      @answers = {}
      @header ={
          :status => e.message,
          :errorCode => 400
      }
    end
    render json: {:response => @answers, :header => @header}, :status => @header[:errorCode]
  end

  def create
    begin
      @articles = Answer.create!({answer_json:[:answer_json], structure_json:params[:structure_json]})
      @articles = Answer.last!
      @header ={
          :status => :ok,
          :errorCode => 200
      }
    rescue => e
      @articles = {}
      @header ={
          :status => e.message,
          :errorCode => 400
      }
    end
    render json: {:response => @articles, :header => @header}, :status => @header[:errorCode]
  end

end

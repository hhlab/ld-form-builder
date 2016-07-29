class Api::V1::AnswerController < ApplicationController

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
      @parent_form_structure = FormStructure.find_by!(id: params[:form_structure])
      Answer.create!({answer_json:params[:answer_json], form_structure:@parent_form_structure})
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

class Api::V1::FormStructureController < ApplicationController
  def index
    begin
      @form_structures = FormStructure.all.reverse_order!
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
      @form_structures = FormStructure.find_by!(id: params[:id])
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
      @form_structures = FormStructure.first!
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
      FormStructure.create!({structure_json:params[:structure_json]})
      @form_structures = FormStructure.last!
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

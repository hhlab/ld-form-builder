# coding: utf-8
require "ld/form"
require "ld/visualization/dot"
require "json/ld"

class EnquetesController < ApplicationController
  before_action :set_enquete, only: [:show, :edit, :update, :destroy]

  # GET /enquetes
  # GET /enquetes.json
  def index
    @enquetes = Enquete.all
  end
	
	def upanel
		@time = Time.now.to_s
	end

  # GET /enquetes/1
  # GET /enquetes/1.json
  def show
    @form = Marshal.load(@enquete.form).to_h.to_s	
	end

  # GET /enquetes/new
  def new
    @enquete = Enquete.new
  	@question_types = {
			"チェックボックス（単一選択）" => "checkbox",
			"チェックボックス（複数選択可）" => "multiple_choice",
			"テキスト入力" => "text_area",
			"数値入力（スライダー）" =>"number_field"}
		@form = LD::Form.new('hoge')
	end

	def select_question_type
		print "aaaaaaaaaaaaaaaaaaaaa"	
		respond_to do |format|
		  format.html { render :nothing => true }
		end
	end

  # GET /enquetes/1/edit
  def edit
		gon.clean
		@question_types = {
			"チェックボックス（単一選択）" => "checkbox",
			"チェックボックス（複数選択可）" => "multiple_choice",
			"テキスト入力" => "text_area",
			"数値入力（スライダー）" =>"number_field"
		}
		@form = Marshal.load(@enquete.form.force_encoding('UTF-8'))
		gon.title = @enquete.title
		gon.fo = @form.to_h

		
	end

  # POST /enquetes
  # POST /enquetes.json
  def create
    @enquete = Enquete.new(enquete_params)

    respond_to do |format|
      if @enquete.save
				format.html { redirect_to @enquete, notice: 'Enquete was successfully created.' }
				format.json { render :show, status: :created, location: @enquete }
      else
        format.html { render :new }
        format.json { render json: @enquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enquetes/1
  # PATCH/PUT /enquetes/1.json
  def update
    respond_to do |format|
      if @enquete.update(enquete_params)
        format.html { redirect_to @enquete, notice: 'Enquete was successfully updated.' }
        format.json { render :show, status: :ok, location: @enquete }
      else
        format.html { render :edit }
        format.json { render json: @enquete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enquetes/1
  # DELETE /enquetes/1.json
  def destroy
    @enquete.destroy
    respond_to do |format|
      format.html { redirect_to enquetes_url, notice: 'Enquete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquete
      @enquete = Enquete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enquete_params

      f0 = JSON.parse(params[:json_data].gsub(/'/, '"'))
			puts f0
      @f = LD::Form.create do
        title f0['title']
        url f0['url']
        f0['question'].each do |q|
          print q, "\n"
          case q['type']
          when 'checkbox' then
            checkbox do
              title q['title']
              options q['options']
            end
					when 'multiple_choice' then
						multiple_choice do
							title q['title']
							options q['options']
						end
					when 'number_field' then
						number_field do
							title q['title']
							min q['min']
							max q['max']
						end
						self.items.last.min = q['min']
						self.items.last.max = q['max']
					when 'text_area' then
						text_area do
							title q['title']
						end
					end
        end     
      end
			
      p '___',@f
      #params[:enquete][:form] = params[:json_data]
      params[:enquete][:form] = Marshal.dump(@f)
      params.require(:enquete).permit(:title, :form)
    end
end

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
  end

  # GET /enquetes/new
  def new
    @enquete = Enquete.new
  	@question_types = ["checkbox","multiple_choice","text_area","number_field"]
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
  	@question_types = ["checkbox","multiple_choice","text_area","number_field"]
	end

  # POST /enquetes
  # POST /enquetes.json
  def create
    @enquete = Enquete.new(enquete_params)
		print(@enquete.form)
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
			params[:enquete][:form] = params[:json_data]
      params.require(:enquete).permit(:title, :form)
    end
end

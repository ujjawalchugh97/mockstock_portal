class ExRatesController < ApplicationController
  before_action :set_ex_rate, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /ex_rates
  # GET /ex_rates.json
  def index
    @ex_rates = ExRate.all
  end

  # GET /ex_rates/1
  # GET /ex_rates/1.json
  def show
  end

  # GET /ex_rates/new
  def new
    @ex_rate = ExRate.new
  end

  # GET /ex_rates/1/edit
  def edit
  end

  # POST /ex_rates
  # POST /ex_rates.json
  def create
    @ex_rate = ExRate.new(ex_rate_params)

    respond_to do |format|
      if @ex_rate.save
        format.html { redirect_to @ex_rate, notice: 'Ex rate was successfully created.' }
        format.json { render :show, status: :created, location: @ex_rate }
      else
        format.html { render :new }
        format.json { render json: @ex_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ex_rates/1
  # PATCH/PUT /ex_rates/1.json
  def update
    respond_to do |format|
      if @ex_rate.update(ex_rate_params)
        format.html { redirect_to @ex_rate, notice: 'Ex rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @ex_rate }
      else
        format.html { render :edit }
        format.json { render json: @ex_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ex_rates/1
  # DELETE /ex_rates/1.json
  def destroy
    @ex_rate.destroy
    respond_to do |format|
      format.html { redirect_to ex_rates_url, notice: 'Ex rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ex_rate
      @ex_rate = ExRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ex_rate_params
      params.require(:ex_rate).permit(:m1, :m2, :m1c, :m2c, :rate)
    end
end

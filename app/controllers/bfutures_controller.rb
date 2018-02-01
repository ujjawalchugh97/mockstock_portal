class BfuturesController < ApplicationController
  before_action :set_bfuture, only: [:show, :edit, :update, :destroy]

  # GET /bfutures
  # GET /bfutures.json
  def index
    @bfutures = Bfuture.all
  end

  # GET /bfutures/1
  # GET /bfutures/1.json
  def show
  end

  # GET /bfutures/new
  def new
    @bfuture = Bfuture.new
  end

  # GET /bfutures/1/edit
  def edit
  end

  # POST /bfutures
  # POST /bfutures.json
  def create
    @bfuture = Bfuture.new(bfuture_params)

    respond_to do |format|
      if @bfuture.save
        format.html { redirect_to @bfuture, notice: 'Bfuture was successfully created.' }
        format.json { render :show, status: :created, location: @bfuture }
      else
        format.html { render :new }
        format.json { render json: @bfuture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bfutures/1
  # PATCH/PUT /bfutures/1.json
  def update
    respond_to do |format|
      if @bfuture.update(bfuture_params)
        format.html { redirect_to @bfuture, notice: 'Bfuture was successfully updated.' }
        format.json { render :show, status: :ok, location: @bfuture }
      else
        format.html { render :edit }
        format.json { render json: @bfuture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bfutures/1
  # DELETE /bfutures/1.json
  def destroy
    @bfuture.destroy
    respond_to do |format|
      format.html { redirect_to bfutures_url, notice: 'Bfuture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bfuture
      @bfuture = Bfuture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bfuture_params
      params.require(:bfuture).permit(:stock_id, :time, :buying_price, :price_per_share)
    end
end

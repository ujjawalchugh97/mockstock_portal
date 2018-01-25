class SfuturesController < ApplicationController
  before_action :set_sfuture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!


  # GET /sfutures
  # GET /sfutures.json
  def index
    @sfutures = Sfuture.all
  end

  # GET /sfutures/1
  # GET /sfutures/1.json
  def show
  end

  # GET /sfutures/new
  def new
    @sfuture = Sfuture.new
  end

  # GET /sfutures/1/edit
  def edit
  end

  # POST /sfutures
  # POST /sfutures.json
  def create
    @sfuture = Sfuture.new(sfuture_params)

    respond_to do |format|
      if @sfuture.save
        format.html { redirect_to @sfuture, notice: 'Sfuture was successfully created.' }
        format.json { render :show, status: :created, location: @sfuture }
      else
        format.html { render :new }
        format.json { render json: @sfuture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sfutures/1
  # PATCH/PUT /sfutures/1.json
  def update
    respond_to do |format|
      if @sfuture.update(sfuture_params)
        format.html { redirect_to @sfuture, notice: 'Sfuture was successfully updated.' }
        format.json { render :show, status: :ok, location: @sfuture }
      else
        format.html { render :edit }
        format.json { render json: @sfuture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sfutures/1
  # DELETE /sfutures/1.json
  def destroy
    @sfuture.destroy
    respond_to do |format|
      format.html { redirect_to sfutures_url, notice: 'Sfuture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sfuture
      @sfuture = Sfuture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sfuture_params
      params.require(:sfuture).permit(:stock_id, :time, :selling_price, :price_per_share)
    end
end

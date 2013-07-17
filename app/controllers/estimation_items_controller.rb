class EstimationItemsController < ApplicationController
  before_action :set_estimation_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /estimation_items
  # GET /estimation_items.json
  def index
    @estimation_items = EstimationItem.all
  end

  # GET /estimation_items/1
  # GET /estimation_items/1.json
  def show
  end

  # GET /estimation_items/new
  def new
    @estimation_item = EstimationItem.new
  end

  # GET /estimation_items/1/edit
  def edit
  end

  # POST /estimation_items
  # POST /estimation_items.json
  def create
    @estimation_item = EstimationItem.new(estimation_item_params)

    respond_to do |format|
      if @estimation_item.save
        format.html { redirect_to @estimation_item, notice: 'Estimation item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @estimation_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @estimation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimation_items/1
  # PATCH/PUT /estimation_items/1.json
  def update
    respond_to do |format|
      if @estimation_item.update(estimation_item_params)
        format.html { redirect_to @estimation_item, notice: 'Estimation item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @estimation_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimation_items/1
  # DELETE /estimation_items/1.json
  def destroy
    @estimation_item.destroy
    respond_to do |format|
      format.html { redirect_to estimation_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estimation_item
      @estimation_item = EstimationItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estimation_item_params
      params.require(:estimation_item).permit(:part_detail, :material, :thk_dia, :dimension_h, :dimension_w, :dimension_l, :wt_ibs_ft, :qty, :uom, :weight, :unit_price, :remarks)
    end
end
class SparesController < ApplicationController
  before_action :set_spare, only: [:show, :edit, :update, :destroy]

  # GET /spares
  # GET /spares.json
  def index
    @spares = Spare.all
  end

  # GET /spares/1
  # GET /spares/1.json
  def show
  end

  # GET /spares/new
  def new
    @spare = Spare.new
  end

  # GET /spares/1/edit
  def edit
  end

  # POST /spares
  # POST /spares.json
  def create
    @spare = Spare.new(spare_params)
    respond_to do |format|
      if @spare.save
        SparesInventory.create(spare_id: @spare.id, available_quantity: "0", alert_minimum_quantity: "0")
        format.html { redirect_to spares_path, notice: 'Spare was successfully created.' }
        format.json { render :show, status: :created, location: @spare }
      else
        format.html { render :new }
        format.json { render json: @spare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spares/1
  # PATCH/PUT /spares/1.json
  def update
    respond_to do |format|
      if @spare.update(spare_params)
        format.html { redirect_to @spare, notice: 'Spare was successfully updated.' }
        format.json { render :show, status: :ok, location: @spare }
      else
        format.html { render :edit }
        format.json { render json: @spare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spares/1
  # DELETE /spares/1.json
  def destroy
    @spare.destroy
    respond_to do |format|
      format.html { redirect_to spares_url, notice: 'Spare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spare
      @spare = Spare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spare_params
      params.require(:spare).permit(:unit_id, :spares_category_id, :part_number, :item_name, :description)
    end
end

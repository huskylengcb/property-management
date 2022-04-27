class TowersController < ApplicationController
  before_action :set_tower, only: %i[ show edit update destroy ]

  # GET /towers or /towers.json
  def index
    @search = Tower.sorted.ransack(params[:q])
    @towers = @search.result.page(params[:page])
  end

  # GET /towers/1 or /towers/1.json
  def show
  end

  # GET /towers/new
  def new
    @tower = Tower.new
  end

  # GET /towers/1/edit
  def edit
  end

  # POST /towers or /towers.json
  def create
    @tower = Tower.new(tower_params)

    respond_to do |format|
      if @tower.save
        format.html { redirect_to towers_url, notice: "楼栋信息新建成功" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /towers/1 or /towers/1.json
  def update
    respond_to do |format|
      if @tower.update(tower_params)
        format.html { redirect_to towers_url, notice: "楼栋信息修改成功" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /towers/1 or /towers/1.json
  def destroy
    @tower.destroy

    respond_to do |format|
      format.html { redirect_to towers_url, notice: "楼栋信息删除成功" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tower
      @tower = Tower.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tower_params
      params.require(:tower).permit!
    end
end

class Admin::AdvertsController < Admin::BaseController
  before_action :set_advert, only: %i[ show edit update destroy ]

  def index
    @search = Advert.ransack(params[:q])
    @adverts = @search.result.page(params[:page])
  end

  def show
  end

  def new
    @advert = Advert.new
  end

  def edit
  end

  def create
    @advert = Advert.new(advert_params)

    respond_to do |format|
      if @advert.save
        format.html { redirect_to admin_adverts_path, notice: "Advert was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to admin_adverts_path, notice: "Advert was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @advert.destroy

    respond_to do |format|
      format.html { redirect_to admin_adverts_url, notice: "Advert was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advert_params
      params.require(:advert).permit(:name, :category_id, :description, :phone, :wechat, :state, :user_id)
    end
end

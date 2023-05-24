class Admin::AdvertsController < Admin::BaseController
  before_action :set_advert, only: %i[ show edit update destroy switch move ]

  def index
    @search = Advert.sorted.ransack(params[:q])
    @adverts = @search.result.page(params[:page])
  end

  def show
  end

  def new
    @advert = Advert.new
  end

  def edit
  end

  def move
    move_target = params[:to]
    return unless ['higher', 'lower', 'to_top', 'to_bottom'].include?(move_target)

    @advert.send("move_#{move_target}")
    redirect_back(fallback_location: root_path)
  end

  def switch
    @advert.visible? ? @advert.hidden! : @advert.visible!
    redirect_back(fallback_location: root_path)
  end

  def create
    @advert = Advert.new(advert_params)
    @advert.user = current_user

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

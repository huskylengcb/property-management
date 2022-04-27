class CategoriesController < ApplicationController
  before_action :set_type
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @search = @klass.ransack(params[:q])
    @categories = @search.result.default.page(params[:page])
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  def move
    move_target = params[:to]
    return unless ['higher', 'lower', 'to_top', 'to_bottom'].include?(move_target)
    @category = Category.find(params[:id])

    @category.send("move_#{move_target}")
    redirect_to :back
  end

  # GET /categories/new
  def new
    @category = @klass.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = @klass.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path(type: params[:type]), notice: "Category was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path(type: params[:type]), notice: "Category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url(type: params[:type]), notice: "Category was successfully destroyed." }
    end
  end

  private
    def set_type
      params[:type] ||= Category.types.first
      @klass = "Category::#{params[:type]}".constantize
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:type, :logo, :name, :position, :items_count, :state)
    end
end

class Admin::VocabulariesController < Admin::BaseController
  before_action :set_admin_vocabulary, only: %i[ show edit update destroy ]

  # GET /admin/vocabularies or /admin/vocabularies.json
  def index
    @search = Vocabulary.includes(:vocabulary_category).sorted.ransack(params[:q])
    @vocabularies = @search.result.page(params[:page])
  end

  # GET /admin/vocabularies/1 or /admin/vocabularies/1.json
  def show
  end

  # GET /admin/vocabularies/new
  def new
    @vocabulary = Vocabulary.new
  end

  # GET /admin/vocabularies/1/edit
  def edit
  end

  # POST /admin/vocabularies or /admin/vocabularies.json
  def create
    @vocabulary = Vocabulary.new(admin_vocabulary_params)

    respond_to do |format|
      if @vocabulary.save
        format.html { redirect_to admin_vocabularies_url(@vocabulary), notice: "Vocabulary was successfully created." }
        format.json { render :show, status: :created, location: @vocabulary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/vocabularies/1 or /admin/vocabularies/1.json
  def update
    respond_to do |format|
      if @vocabulary.update(admin_vocabulary_params)
        format.html { redirect_to admin_vocabularies_url(@vocabulary), notice: "Vocabulary was successfully updated." }
        format.json { render :show, status: :ok, location: @vocabulary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/vocabularies/1 or /admin/vocabularies/1.json
  def destroy
    @vocabulary.destroy

    respond_to do |format|
      format.html { redirect_to admin_vocabularies_url, notice: "Vocabulary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_vocabulary_params
      params.require(:vocabulary).permit!
    end
end

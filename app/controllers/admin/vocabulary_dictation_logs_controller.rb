class Admin::VocabularyDictationLogsController < ApplicationController
  before_action :set_admin_vocabulary_dictation_log, only: %i[ show edit update destroy ]

  # GET /admin/vocabulary_dictation_logs or /admin/vocabulary_dictation_logs.json
  def index
    @admin_vocabulary_dictation_logs = Admin::VocabularyDictationLog.all
  end

  # GET /admin/vocabulary_dictation_logs/1 or /admin/vocabulary_dictation_logs/1.json
  def show
  end

  # GET /admin/vocabulary_dictation_logs/new
  def new
    @admin_vocabulary_dictation_log = Admin::VocabularyDictationLog.new
  end

  # GET /admin/vocabulary_dictation_logs/1/edit
  def edit
  end

  # POST /admin/vocabulary_dictation_logs or /admin/vocabulary_dictation_logs.json
  def create
    @admin_vocabulary_dictation_log = Admin::VocabularyDictationLog.new(admin_vocabulary_dictation_log_params)

    respond_to do |format|
      if @admin_vocabulary_dictation_log.save
        format.html { redirect_to admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log), notice: "Vocabulary dictation log was successfully created." }
        format.json { render :show, status: :created, location: @admin_vocabulary_dictation_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin_vocabulary_dictation_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/vocabulary_dictation_logs/1 or /admin/vocabulary_dictation_logs/1.json
  def update
    respond_to do |format|
      if @admin_vocabulary_dictation_log.update(admin_vocabulary_dictation_log_params)
        format.html { redirect_to admin_vocabulary_dictation_log_url(@admin_vocabulary_dictation_log), notice: "Vocabulary dictation log was successfully updated." }
        format.json { render :show, status: :ok, location: @admin_vocabulary_dictation_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin_vocabulary_dictation_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/vocabulary_dictation_logs/1 or /admin/vocabulary_dictation_logs/1.json
  def destroy
    @admin_vocabulary_dictation_log.destroy

    respond_to do |format|
      format.html { redirect_to admin_vocabulary_dictation_logs_url, notice: "Vocabulary dictation log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_vocabulary_dictation_log
      @admin_vocabulary_dictation_log = Admin::VocabularyDictationLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_vocabulary_dictation_log_params
      params.fetch(:admin_vocabulary_dictation_log, {})
    end
end

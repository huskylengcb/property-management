class Api::V1::VocabularyDictationLogsController < Api::V1::BaseController
  def index
  end

  def create
    vocabulary_dictation_log = VocabularyDictationLog.new({right: params[:right], wrong: params[:wrong], user_id: current_user.id})
    if vocabulary_dictation_log.save
      api_success(message: '请求成功', data: { vocabulary_dictation_log: vocabulary_dictation_log.to_builder })
    else
      api_error(message: '请求失败', data: { errors: vocabulary_dictation_log.errors.message })
    end
  end
end

class Api::V1::CommunitiesController < Api::V1::BaseController
  def index
    communuties = ::Community.sorted
    api_success(message: '请求成功', data: { communuties: communuties.map { |community| community.detail_builder } })
  end
end

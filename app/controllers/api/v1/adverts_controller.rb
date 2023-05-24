class Api::V1::AdvertsController < Api::V1::BaseController
  def index
    adverts = Advert.all
    api_success(message: '请求成功', data: { adverts: adverts.map { |advert| advert.detail_builder } })
  end
end

class Api::V1::CategoriesController < Api::V1::BaseController

  def index
    categories = Category.where(parent_id: nil)
    api_success(message: '请求成功', data: { categories: categories.map { |category| category.detail_builder } })
  end
end
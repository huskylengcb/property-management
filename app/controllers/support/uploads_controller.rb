class Support::UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :ckedit
  def create
    klass = "Asset::#{params[:asset_type].classify}".constantize
    asset = klass.new(file: params[:file])
    result = asset.save
    render json: {result: result, error: asset.errors.full_messages, id: asset.try(:id), protect_token: asset.protect_token, url: asset.file.try(:url)}
  end

  def destroy
    @file_id = params[:file_id]
    asset = Asset.find(params[:id])
    @result = asset.protect_token == params[:protect_token]
    if @result
      asset.destroy
    end
  end

  def wangedit
    asset = Asset.new(file: params[:file])
    byebug
    if result = asset.save
      render plain: asset.file.try(:url)
    else
      render plain: asset.errors.full_messages
    end
  end
end

class AdvertImageUploader < BaseUploader
  process :auto_orient

  version :tiny do
    process :resize_to_fill => [128, 54]
  end
end
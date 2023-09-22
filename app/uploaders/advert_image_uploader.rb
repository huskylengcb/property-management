class AdvertImageUploader < BaseUploader
  process :auto_orient

  version :tiny do
    process :resize_to_fill => [128, 54]
  end

  # version :small do
  #   process :resize_to_fill => [140, 140]
  # end

  # version :medium do
  #   process :resize_to_fill => [360, 360]
  # end

  # version :large do
  #   process :resize_to_fill => [640, 640]
  # end

end
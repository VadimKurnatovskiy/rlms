class AttachmentUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "attachments/#{model.class.to_s.underscore}_#{model.id}"
  end

  def extension_whitelist
    %w(pdf docx png)
  end
end

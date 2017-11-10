class Material < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader

  belongs_to :topic
  has_one :video, dependent: :destroy
  accepts_nested_attributes_for :video, reject_if: proc { |attrs| attrs[:link].blank? }

  validates :topic_id, presence: true

  def title_h
    title.present? ? title : attachment.file.filename
  end
end

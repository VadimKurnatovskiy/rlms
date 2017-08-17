class Material < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader

  belongs_to :topic

  validates :topic_id, presence: true
end

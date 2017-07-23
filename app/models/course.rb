class Course < ApplicationRecord
  belongs_to :teacher

  validates :title, :description, presence: true

  scope :published, -> { where(published: true) }
  scope :not_published, -> { where(published: false) }
end

class Topic < ApplicationRecord
  belongs_to :course

  validates :title, :course_id, presence: true
end

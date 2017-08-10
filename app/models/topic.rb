class Topic < ApplicationRecord
  belongs_to :course

  validates :title, :course_id, presence: true

  scope :ordered_by_index, -> { order(order_index: :asc) }
end

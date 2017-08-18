class Topic < ApplicationRecord
  belongs_to :course

  has_many :materials, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, :course_id, presence: true

  scope :ordered_by_index, -> { order(order_index: :asc) }
end

class Topic < ApplicationRecord
  belongs_to :course

  has_many :materials, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :title, :slug, :course_id, presence: true
  validates :title, :slug, uniqueness: true

  scope :ordered_by_index, -> { order(order_index: :asc) }

  def materials_count
    materials.count
  end

  def to_param
    slug
  end
end

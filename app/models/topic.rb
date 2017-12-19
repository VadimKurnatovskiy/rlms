class Topic < ApplicationRecord
  belongs_to :course

  has_many :materials, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validate :slug_topic_validate
  validates :title, :slug, :course_id, presence: true
  validates :title, :slug, uniqueness: true

  scope :ordered_by_index, -> { order(order_index: :asc) }

  WHITELIST = /^[a-zA-Z0-9_-]*$/
  def slug_topic_validate
    unless WHITELIST=~ slug 
      errors[:slug] << "Slug not valid" 
    end
  end

  def to_param
    slug
  end

  def materials_count
    materials.count
  end
end

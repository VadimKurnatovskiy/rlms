class Video < ApplicationRecord
  belongs_to :material
  validates :material_id, :link, presence: true
  validate :link_must_be_youtube_or_vimeo_link

  def link_must_be_youtube_or_vimeo_link
    return if %w[youtube vimeo].any? { |host| link.include?(host) }
    errors.add(:link, 'is not a youtube or vimeo link!')
  end
end

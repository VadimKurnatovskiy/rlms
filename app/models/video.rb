class Video < ApplicationRecord
  belongs_to :material
  validates :material_id, presence: true
  validate :link_must_be_youtube_or_vimeo_link

  def link_must_be_youtube_or_vimeo_link
  	unless link.include?("youtube") || link.include?("vimeo")
  		errors.add(:link, "is not a youtube or vimeo link")
  	end	
  end
end

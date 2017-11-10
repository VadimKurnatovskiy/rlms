module MaterialsHelper
  def src(link, video_id)
    if link.include?("youtube")
      "https://www.youtube.com/embed/#{video_id}"
    else
      "https://player.vimeo.com/video/#{video_id}"
    end
  end

  def get_id(link)
    youtube_regex = /youtube.com.*(?:\/|v=)([^&$]+)/
    vimeo_regex = /https?:\/\/(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/([^\/]*)\/videos\/|album\/(\d+)\/video\/|video\/|)(\d+)(?:$|\/|\?)/
    regex = link.include?("youtube") ? youtube_regex : vimeo_regex

    regex.match(link).to_a.compact[1]
  end
end

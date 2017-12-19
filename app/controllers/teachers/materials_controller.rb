module Teachers
  class MaterialsController < BaseController
    respond_to :js

    expose :topic
    expose :material

    def create
      material.topic = topic
      material.save
      save_video
    end

    def destroy
      material.destroy
    end

    private

    def save_video
      video_params = params[:material][:video]
      return if video_params[:link].empty?
      video = material.build_video(title: video_params[:title],
                                   link: video_params[:link])
      video.save!
    end

    def material_params
      params.require(:material)
            .permit(:title, :attachment, video_attributes: %i[title link])
    end
  end
end

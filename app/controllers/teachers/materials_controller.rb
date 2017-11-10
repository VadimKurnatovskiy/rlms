module Teachers
  class MaterialsController < BaseController
    respond_to :js

    expose :topic
    expose :material

    def create
      material.topic = topic
      material.save
      video_params = params[:material][:video]
      unless video_params[:link].empty?
        video = material.build_video(title: video_params[:title],
                                     link: video_params[:link])
        video.save!
      end
    end

    def destroy
      material.destroy
    end

    private

    def material_params
      params.require(:material)
      .permit(:title, :attachment, video_params: [:title, :link])
    end

  end
end

module Teachers
  class MaterialsController < BaseController
    respond_to :html

    expose :topic
    expose :material

    def create
      material.save

      redirect_back fallback_location: teachers_topic_path(topic)
    end

    def update
      material.update_attributes(material_params)
    end

    def destroy
      material.destroy

      redirect_back fallback_location: teachers_topic_path(topic)
    end


    private

    def material_params
      params.require(:material)
            .permit(:title, :attachment)
            .merge({ topic_id: topic.id })
    end
  end
end

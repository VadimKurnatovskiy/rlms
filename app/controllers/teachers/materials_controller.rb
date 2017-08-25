module Teachers
  class MaterialsController < BaseController
    respond_to :js

    expose :topic
    expose :material

    def create
      material.topic = topic
      material.save
    end

    def destroy
      material.destroy
    end

    private

    def material_params
      params.require(:material)
            .permit(:title, :attachment)
    end
  end
end

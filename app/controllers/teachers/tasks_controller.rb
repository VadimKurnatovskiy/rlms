module Teachers
  class TasksController < BaseController
    respond_to :js

    expose :topic
    expose :task

    def create
      task.topic = topic
      task.save
    end

    def destroy
      task.destroy
    end

    private

    def task_params
      params.require(:task)
            .permit(:title, :attachment)
    end
  end
end

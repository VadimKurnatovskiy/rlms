module Learners
  class TopicsController < BaseController
    respond_to :html

    expose :topic
    expose :course, from: :topic

    def show; end
  end
end

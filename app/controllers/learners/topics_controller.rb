module Learners
  class TopicsController < BaseController
    respond_to :html

    expose :topic, find_by: :slug, id: :slug
    expose :course, from: :topic

    def show; end
  end
end

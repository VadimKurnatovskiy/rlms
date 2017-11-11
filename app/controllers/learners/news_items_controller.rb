module Learners
  class NewsItemsController < BaseController
    respond_to :html

    expose :news_item
    expose :courses, from: :current_learner
    expose :news_items, from: :courses

    def index; end

    def show; end
  end
end

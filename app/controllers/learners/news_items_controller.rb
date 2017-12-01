module Learners
  class NewsItemsController < BaseController
    respond_to :html

    expose :news_item
    expose :courses, from: :current_learner
    expose :news_items, from: :courses
    
    def index
      respond_with news_items
    end

    def show
      respond_with news_item
    end
  end
end

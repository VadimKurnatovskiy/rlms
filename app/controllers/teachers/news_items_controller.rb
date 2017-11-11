module Teachers
  class NewsItemsController < BaseController
    respond_to :html

    NEWS_ITEMS_PARAMS = %i[title body course_id]

    expose :course, find_by: :slug, id: :course_slug
    expose :news_item
    expose :news_items, from: :course

    def index
      respond_with news_items
    end

    def new; end

    def create
      news_item.course = course
      if news_item.save
        respond_with :teachers, course, news_item
      else
        render :new
      end   
    end

    def show
      respond_with news_item
    end

    def edit; end

    def update
      news_item.update(news_items_params)

      respond_with :teachers, news_item
    end

    private

    def news_items_params
      params.require(:news_item).permit(*NEWS_ITEMS_PARAMS)
    end
  end
end

module Teachers
  class DashboardController < BaseController
    before_action :authenticate_teacher!

    def show; end
  end
end

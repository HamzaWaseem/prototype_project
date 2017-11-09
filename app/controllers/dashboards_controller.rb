class DashboardsController < ApplicationController

  def index
    @forms_count = Form.all.count
    @users_count = User.all.count
  end
end

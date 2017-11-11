class DashboardsController < ApplicationController

  def index
    @forms_count = Form.all.count
    @users_count = User.all.count
    @critical_forms_count = Form.where(category_level: AppConstants::CRITICAL).count
    @high_forms_count = Form.where(category_level: AppConstants::HIGH).count
    @medium_forms_count = Form.where(category_level: AppConstants::MEDIUM).count
    @low_forms_count = Form.where(category_level: AppConstants::LOW).count
  end
end

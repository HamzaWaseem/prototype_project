class DashboardsController < ApplicationController

  def index
    @forms_count = Form.all.count
    @users_count = User.all.count
    @critical_forms_count = Form.where(category_level: AppConstants::CRITICAL).count
    @high_forms_count = Form.where(category_level: AppConstants::HIGH).count
    @medium_forms_count = Form.where(category_level: AppConstants::MEDIUM).count
    @low_forms_count = Form.where(category_level: AppConstants::LOW).count
    @department_a_count = Form.where(department: AppConstants::DEPARTMENT_A).count
    @department_b_count = Form.where(department: AppConstants::DEPARTMENT_B).count
    @department_c_count = Form.where(department: AppConstants::DEPARTMENT_C).count
  end
end

class FormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
      @forms = Form.all
  end

  def show
  end

  def new
    @form = Form.new
  end

  def edit
  end

  def create
    # binding.pry
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # binding.pry
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def critical_forms
    @forms = Form.where(category_level: AppConstants::CRITICAL)
  end

  def high_forms
    @forms = Form.where(category_level: AppConstants::HIGH)
  end

  def medium_forms
    @forms = Form.where(category_level: AppConstants::MEDIUM)
  end

  def low_forms
    @forms = Form.where(category_level: AppConstants::LOW)
  end

  def department_a_forms
    @forms = Form.where(department: AppConstants::DEPARTMENT_A)
  end

  def department_b_forms
    @forms = Form.where(department: AppConstants::DEPARTMENT_B)
  end

  def department_c_forms
    @forms = Form.where(department: AppConstants::DEPARTMENT_C)
  end

  private
    def set_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:department, :category, :date_started, :date_completed,  :summary_of_problem, :impact, :applicable_to_other_areas, :user_id, :solution_applied, :category_level,:updated_by,:completed_by,:is_complete)
    end
end

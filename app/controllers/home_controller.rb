class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @forms = Form.all
    render :layout => false
  end

end

class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    render :index
  end

  private

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end
end

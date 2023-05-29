class UsersController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  def index
    @user = User.includes(:categories).find(current_user.id)
  end
end

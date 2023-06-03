class UsersController < ApplicationController
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  def index
    @user = User.includes(categories: :proceedings).find(current_user.id)
    @categories = @user.categories
  end
end

class CategoriesController < ApplicationController
  def new
    @category = Category.new
    @user = current_user
  end

  def create
    @category = Category.new(categories_params)
    @user = User.find(current_user.id)
    @category.author_id = @user.id
    authorize! :create, @category
    if @category.valid?
      @category.save
      flash[:notice] = 'Category added successfully'
      redirect_to users_path
    else
      flash[:alert] = 'Category not added'
      @error = @category.errors.full_messages
      render :new
    end
  end

  def show
    @category = Category.includes(:proceedings).order('proceedings.created_at DESC').find(params[:id])
    @proceedings = @category.proceedings
    @total = 0
    @proceedings.each do |proceeding|
      @total += proceeding.amount
    end

    authorize! :read, @category
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon)
  end
end

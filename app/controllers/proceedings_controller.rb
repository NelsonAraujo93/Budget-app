class ProceedingsController < ApplicationController
  def new
    @proceeding = Proceeding.new
    @user = current_user
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @user = User.find(current_user.id)
    @proceeding = Proceeding.new(proceedings_params)
    @proceeding.author_id = @user.id
    @proceeding.categories << @category
    authorize! :create, @proceeding
    if @proceeding.valid?
      @proceeding.save
      flash[:notice] = 'Transaction added successfully'
      redirect_to category_path(@category.id)
    else
      flash[:alert] = 'Transaction not added'
      @error = @proceeding.errors.full_messages
      render :new
    end
  end

  private

  def proceedings_params
    params.require(:proceeding).permit(:name, :amount)
  end
end

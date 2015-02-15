class UsersController < ApplicationController

  def index
    @search = Search::SyanaiUser.new
  end

  def new
  end

  def edit
    @form = User.find(params[:id])
  end

  def update
    @form = User.find(params[:id])
    @form.attributes = form_params
    if @user.save
      flash[:alert] = "編集しました" # TODO: 直す
      redirect_to :users
    else
      render :edit
    end
  end

  def search
    @search = Search::SyanaiUser.new(params[:search_syanai_user])
    @lists = @search.matches
      .page(params[:page])
      .per(10)
      .order(:id)
  end

  private

  def form_params
    params.require(:list).permit(:directory_id)
  end
end

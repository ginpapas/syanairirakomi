class RecommendsController < ApplicationController
  def index
    @recommends=Recommend.all
  end

  def edit
    @recommend = Recommend.find(params[:id])
  end

  def update
    @recommend = Recommend.find(params[:id])
    @recommend.attributes = recommend_params
    if @recommend.save
      flash[:alert] = "編集しました" # TODO: 直す
      redirect_to :recommends
    else
      render :edit
    end
  end

  private

  def recommend_params
    params.require(:recommend).permit(:good_comment, :bad_comment, :tenpo_comment, :visible)
  end

end

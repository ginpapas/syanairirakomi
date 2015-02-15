class OperatorsController < ApplicationController
  def index
    @lists=Operator.all
  end

  def new
  end

  def edit
    @form = Operator.find(params[:id])
  end

  def update
    @form = Operator.find(params[:id])
    @form.attributes = form_params
    if @recommend.save
      flash[:alert] = "編集しました" # TODO: 直す
      redirect_to :recommends
    else
      render :edit
    end
  end

  private

  def form_params
    params.require(:operator).permit(:directory_id)
  end
end

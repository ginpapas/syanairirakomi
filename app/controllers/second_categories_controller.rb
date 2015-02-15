class SecondCategoriesController < ApplicationController

  def index
    @lists=SecondCategory.all
  end

  def new
    @form = SecondCategory.new
  end

  def create
    @form = SecondCategory.new(item_params)
    if @form.save
      flash[:alert] = "登録しました" # TODO: 直す
      redirect_to :second_categories
    else
      render :new
    end
  end

  def edit
    @form = SecondCategory.find(params[:id])
  end

  def update
    @form = SecondCategory.find(params[:id])
    @form.attributes = item_params
    if @form.save
      flash[:alert] = "編集しました" # TODO: 直す
      redirect_to :second_categories
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:second_category).permit(:name,:code)
  end
end

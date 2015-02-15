class MuryosController < ApplicationController
  def index
    @lists = Muryo.all
  end

  def new
  end

  def show
    @muryo = Muryo.find(params[:id])
    @directories = Directory.where(tel_sml: @muryo.tel.gsub('-','')).all
    @operators = Operator.where(email: @muryo.email).all
  end

  def edit
    @form = Directory.find(params[:id])
  end

  def update
    @form = Directory.find(params[:id])
    @form.attributes = form_params
    if @user.save
      flash[:alert] = "編集しました" # TODO: 直す
      redirect_to :users
    else
      render :edit
    end
  end

  def search
    @search = Search::SyanaiDirectory.new(params[:search_syanai_directory])
    @lists = @search.matches
      .page(params[:page])
      .per(30)
      .order(:id)
  end

  private

  def form_params
    params.require(:list).permit(:directory_id)
  end

end

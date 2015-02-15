class DirectoriesController < ApplicationController

  def index
    @search = Search::SyanaiDirectory.new
  end

  def add
    @muryo=Muryo.find(params[:muryo_id])

    #directoriesへの追加
    d = Directory.new
    d.name=@muryo.name
    d.master_name=@muryo.master_name
    d.prefecture_id=@muryo.prefecture_id
    d.city_id=@muryo.city_id
    d.address1=@muryo.address1
    d.tel=@muryo.tel
    d.tel_sml=@muryo.tel.gsub('-','')
    d.save!
    Operator.create!({:email => @muryo.email,  :password => "12345678", :password_confirmation => "12345678", directory_id: d.id })
    @muryo.copied_at = Time.now
    @muryo.save!

    redirect_to :thanks_directories
  end

  def new
  end

  def thanks
  end

  def edit
    @form = Directory.find(params[:id])
  end

  def update
    @form = Directory.find(params[:id])
    @form.attributes = form_params
    if @form.save
      flash[:alert] = "編集しました" # TODO: 直す
      redirect_to :directories
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
    params.require(:directory).permit(:lease_type)
  end
end

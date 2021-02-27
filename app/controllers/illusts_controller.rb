class IllustsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:destroy]

  def index
    @illusts=Illust.all
  end

  def new
    @illust = Illust.new
  end

  def create
    @illust = Illust.new(illust_params)
    if @illust.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @illust = Illust.find(params[:id])
  end

  def destroy
    @illust=Illust.find(params[:id])
    unless current_user.id == @illust.user_id
      redirect_to action: :show
    end
    illust.destroy
    redirect_to root_path
  end

  private
  def illust_params
    params.require(:illust).permit(:title,:text,:image).merge(user_id: current_user.id)
  end
end

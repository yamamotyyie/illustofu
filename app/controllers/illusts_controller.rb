class IllustsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:destroy,:edit]
  before_action :set_illust,only: [:show,:edit,:update,:destroy]

  def index
    @illusts=Illust.includes(:user).order("created_at DESC")
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
    @comment= Comment.new
    @comments = @illust.comments.includes(:user)
  end

  def edit
    unless current_user.id == @illust.user_id
      redirect_to root_path
    end
  end

  def update
    if @illust.update(illust_params)
      redirect_to illust_path
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == @illust.user_id
      redirect_to action: :show
    end
    @illust.destroy
    redirect_to root_path
  end

  private
  def illust_params
    params.require(:illust).permit(:title,:text,:image).merge(user_id: current_user.id)
  end

  def set_illust
    @illust=Illust.find(params[:id])
  end
end

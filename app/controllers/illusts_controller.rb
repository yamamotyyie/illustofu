class IllustsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:destroy,:edit]
  before_action :set_illust,only: [:show,:edit,:update,:destroy]

  # イラストの一覧表示
  def index
    @illusts=Illust.includes(:user).order("created_at DESC")
  end

  # イラストの新規投稿
  def new
    @illust = Illust.new
  end

  # イラストを投稿して保存
  def create
    @illust = Illust.new(illust_params)
    if @illust.save
      redirect_to root_path
    else
      render :new
    end
  end

  # イラスト詳細画面
  def show
    @comment= Comment.new
    @comments = @illust.comments.includes(:user)
  end

  # イラスト編集機能
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
  # /イラスト編集機能

  # イラスト削除機能
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

class IllustsController < ApplicationController
  def index
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

  private
  def illust_params
    params.require(:illust).permit(:title,:text,:image).merge(user_id: current_user.id)
  end
end

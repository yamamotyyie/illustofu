class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @illust = @user.illusts
  end
end

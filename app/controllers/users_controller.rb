class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @illusts = @user.illusts
  end
end

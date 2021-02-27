class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
  end


  private
  def comment_params
    params.require(:comment).permit(:messeage).merge(user_id:current_user.id,illust_id: params[:illust_id])
  end
end

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to illust_path(@comment.illust)
    else
      @illust = @comment.illust
      @comments = @illust.comments
      render "illusts/show"
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:messeage).merge(user_id:current_user.id,illust_id: params[:illust_id])
  end
end

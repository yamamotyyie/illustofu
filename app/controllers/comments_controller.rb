class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to illust_path(@comment.illust)
      # コメントの保存が成功したら詳細画面に遷移
    else
      @illust = @comment.illust
      @comments = @illust.comments
      render "illusts/show"
      # 失敗したら入力値を入れ直してページに止まる
    end
  end

  # commentのストロングパラメータ
  private
  def comment_params
    params.require(:comment).permit(:messeage).merge(user_id:current_user.id,illust_id: params[:illust_id])
  end
  # /commentのストロングパラメータ
end

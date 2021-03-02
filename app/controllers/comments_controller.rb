class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/records/#{comment.record.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, record_id: params[:record_id])
  end
end

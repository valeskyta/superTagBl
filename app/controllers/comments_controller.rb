class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def to_s
    comments
  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end
end






class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comments_params)
    @comment.save
  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end
end


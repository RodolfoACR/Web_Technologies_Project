class CommentsController < ApplicationController
  before_action :set_comment, only: [ :edit, :update, :destroy ]
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.profile = current_user.profile

    if @comment.save
      redirect_to @post, notice: "Comment posted!"
    else
      redirect_to @post, alert: "Failed to post comment."
    end
  end


  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.post, notice: "Comment updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = @comment.post
    @comment.destroy
    redirect_to post, notice: "Comment deleted successfully."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end

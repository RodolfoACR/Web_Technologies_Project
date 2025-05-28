class PostsController < ApplicationController
  def index
    @posts = Post.includes(:profile, :hashtags).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @post = @profile.posts.build
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @post = @profile.posts.build(post_params)

    if @post.save
      redirect_to profile_path(@profile), notice: "Post created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :show
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to profile_path(@post.profile), notice: "Post deleted successfully."
  end

  private

  def post_params
    params.require(:post).permit(:image_url, :description)
  end

  def process_hashtags(post, hashtag_string)
    return if hashtag_string.blank?

    tags = hashtag_string.split(/[\s,]+/)

    tags.each do |tag|
      clean_tag = tag.gsub(/^#/, '').downcase
      hashtag = Hashtag.find_by(tag: clean_tag)

      # Solo asocia si existe
      post.hashtags << hashtag if hashtag && !post.hashtags.include?(hashtag)
    end
  end
end

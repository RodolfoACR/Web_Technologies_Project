class PostsController < ApplicationController
  def index
    @posts = Post.includes(:profile, :hashtags).all
  end

  def show
    @post = Post.find(params[:id])
  end

    def new
      @post = current_user.profile.posts.build
    end


  def create
    @post = current_user.profile.posts.build(post_params)

    if @post.save
      process_hashtags(@post, params[:hashtag_list])
      redirect_to @post, notice: "Post created successfully."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    associated_hashtags = @post.hashtags.to_a

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :show
    end

    process_hashtags(@post, params[:hashtag_list])
    associated_hashtags.each do |hashtag|
      hashtag.destroy if hashtag.posts.empty?
    end
  end

  def destroy
    @post = Post.find(params[:id])
    associated_hashtags = @post.hashtags.to_a

    @post.destroy

    associated_hashtags.each do |hashtag|
      hashtag.destroy if hashtag.posts.empty?
    end

    redirect_to profile_path(@post.profile), notice: "Post deleted successfully."
  end

  private

  def post_params
    params.require(:post).permit(:image_url, :description)
  end

  def process_hashtags(post, hashtag_string)
    post.hashtags.clear

    return if hashtag_string.blank?

    tags = hashtag_string.split(',').map { |tag| tag.strip.downcase }.uniq

    tags.each do |tag_name|
      hashtag = Hashtag.find_or_create_by(tag: tag_name)
      post.hashtags << hashtag
    end
  end

end

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts =Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def edit
  end

  def create
    # @post = Post.new(post_params)
    # @post.user_id = current_user.id
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
      ContactMailer.contact_mail(@post).deliver
      redirect_to new_post_path, notice: "作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def update
    if @post.update(post_params)
      redirect_to blog_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
      @post.destroy
      redirect_to posts_path, notice:"削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    render :new if @post.invalid?
  end

  private
  def post_params
    params.require(:post).permit(:image, :image_cache, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end

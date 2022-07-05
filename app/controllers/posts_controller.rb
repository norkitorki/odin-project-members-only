class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update update_rating destroy ]
  before_action :authenticate_user!, except: %i[ index show update_rating ]

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post has been successfully created.'
    else
      flash.now[:alert] = 'Post has not been created.'
      render :index, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post has been successfully updated.'
    else
      flash.now[:alert] = 'Post has not been updated.'
      render :edit, status: :unprocessable_entity
    end
  end

  def update_rating
    session[:post_ratings] ||= []
    
    if session[:post_ratings].none?(@post.id) && @post.update(rating_params)
      session[:post_ratings] << @post.id
      redirect_to @post, notice: 'You liked this post.'
    else
      flash.now[:alert] = 'You have already liked this post.'
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to root_path, notice: 'Post has been successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def rating_params
    params.require(:post).permit(:rating)
  end
end

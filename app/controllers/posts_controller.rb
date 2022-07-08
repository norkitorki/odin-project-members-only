class PostsController < ApplicationController
  before_action :set_post, except: %i[ index create ]
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
      redirect_to @post, notice: 'Post has been successfully created.'
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
    session[:liked_posts] ||= []
    
    if session[:liked_posts].none?(@post.id) && @post.update(post_params)
      session[:liked_posts] << @post.id
      redirect_to @post, notice: 'You liked this post.'
    else
      redirect_to @post, alert: 'You have already liked this post.'
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
    params.require(:post).permit(:title, :body, :rating)
  end
end

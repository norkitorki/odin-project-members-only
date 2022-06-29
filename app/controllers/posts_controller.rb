class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post has been successfully created'
    else
      flash.now[:alert] = 'Post has not been created.'
      render :index, status: :unprocessable_entity
    end
  end

    @post = Post.find(params[:id])
  end
end

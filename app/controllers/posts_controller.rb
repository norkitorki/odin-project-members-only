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
    @post = Post.find(params[:id])
  end
end

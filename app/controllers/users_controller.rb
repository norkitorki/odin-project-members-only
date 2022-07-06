class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(username: params[:username])
    @posts = @user.posts.order('created_at DESC')
  end
end

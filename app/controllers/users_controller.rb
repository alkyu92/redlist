class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:show, :destroy]

  def index
    @users = User.order("created_at").page(params[:page])
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted!"
    redirect_to users_path
  end

  private
  def find_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "Can't find user!"
      redirect_to users_path
  end
end

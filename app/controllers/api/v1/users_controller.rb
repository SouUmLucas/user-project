class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    users = User.all
    if stale? etag: users
      render json: users, status: :ok
    end    
  end

  def show
    if stale? etag: @user
      render json: @user, status: :ok
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
    def set_user
      begin
        @user = User.find(params[:id])
      rescue
        render json: { errors: "User not found" }, status: :not_found
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :birthdate, :phone_number)
    end
end
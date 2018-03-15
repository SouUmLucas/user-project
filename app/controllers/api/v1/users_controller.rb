class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
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
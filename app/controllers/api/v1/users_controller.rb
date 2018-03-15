class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  private
    def set_user
      begin
        @user = User.find(params[:id])
      rescue
        render json: { errors: "User not found" }, status: :not_found
      end
    end
end
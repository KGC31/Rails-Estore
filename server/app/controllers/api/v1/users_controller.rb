class Api::V1::UsersController < ApplicationController
  include Authentication
  before_action :set_user, only: [:show, :update, :destroy]

    # GET /api/v1/users/:id
    def show
      render json: @user
    end

    # PATCH/PUT /api/v1/users/:id
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/v1/users/:id
    def destroy
      @user.destroy
      head :no_content
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :tele, :email, :password)
    end

end

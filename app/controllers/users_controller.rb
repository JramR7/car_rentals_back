class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
   
    if @user.save
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
   
    if @user.update(user_params)
      render json: @user, status: :ok  
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
   
    if @user.destroy
      render json: @user, status: :ok  
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :phone, :email, :id_document, :address)
    end
end

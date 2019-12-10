class OwnersController < ApplicationController
    
    
  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.all
    render json: @owners, status: :ok
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
    @owner = Owner.find(params[:id])
    render json: @owner, status: :ok
  end

  # POST /owners
  # POST /owners.json
  def create
    @user = User.new(user_params)
    @owner = @user.build_owner(owner_params)

    User.transaction do
      if @user.save
        if @owner.save
          render json: @owner, status: :ok
        else
          render json: @owner.errors, status: :unprocessable_entity
        end
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    @owner = Owner.find(params[:id])
    
    if @owner.update(owner_params)
      render json: @owner, status: :ok
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner = Owner.find(params[:id])
    
    if @owner.destroy
      render json: @owner, status: :ok
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
        params.require(:user).permit(:name, :phone, :email, :id_document, :address)
    end

    def owner_params
      params.require(:owner).permit(:licence)
    end
end

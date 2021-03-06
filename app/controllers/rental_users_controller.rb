class RentalUsersController < ApplicationController
  
    # GET /rental_users
    # GET /rental_users.json
    def index
      @rental_users = RentalUser.all
      render json: @rental_users, status: :ok
    end
  
    # GET /rental_users/1
    # GET /rental_users/1.json
    def show
      @rental_user = RentalUser.find(params[:id])
      render json: @rental_user, status: :ok
    end

    # POST /rental_users
    # POST /rental_users.json
    def create
        user = User.find_by(id_document: user_params[:id_document])
        
        if user
            @rental_user = RentalUser.find_by(user_id: user.id)
            render json: @rental_user, status: :ok
        else 
            @user = User.new(user_params)
            @rental_user = @user.build_rental_user()
            
            User.transaction do
                if @user.save
                    if @rental_user.save
                        render json: @rental_user, status: :ok
                    else
                        render json: @rental_user.errors, status: :unprocessable_entity
                    end
                else
                    render json: @user.errors, status: :unprocessable_entity
                end
            end
        end
    end
  
    # PATCH/PUT /rental_users/1
    # PATCH/PUT /rental_users/1.json
    def update
      @rental_user = RentalUser.find(params[:id])
      
      if @rental_user.update(rental_user_params)
        render json: @rental_user, status: :ok
      else
        render json: @rental_user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /rental_users/1
    # DELETE /rental_users/1.json
    def destroy
      @rental_user = RentalUser.find(params[:id])
      
      if @rental_user.destroy
        render json: @rental_user, status: :ok
      else
        render json: @rental_user.errors, status: :unprocessable_entity
      end
    end
  
    private
      def user_params
          params.require(:user).permit(:name, :phone, :email, :id_document, :address)
      end
  end
  
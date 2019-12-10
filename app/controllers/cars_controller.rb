class CarsController < ApplicationController
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
    render json: @cars, status: :ok
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @car = Car.find(params[:id])
    render json: @car, status: :ok
  end

  # POST /cars
  # POST /cars.json
  def create
    @user = User.find_by!(id_document: owner_params[:id_document])
    @owner = Owner.find_by!(user_id: @user.id)
    @car = @owner.car.build(car_params)
   
    if @car.save
      render json: @car, status: :ok
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    @car = Car.find(params[:id])
   
    if @car.update(car_params)
      render json: @car, status: :ok  
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car = Car.find(params[:id])
   
    if @car.destroy
      render json: @car, status: :ok  
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  private
    def owner_params
        params.require(:owner).permit(:id_document)
    end

    def car_params
      params.require(:car).permit(:property_document, :plate, :color, :model, :year, :brand)
    end
end

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
    @car = Car.new(car_params)
   
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
    def car_params
      params.require(:car).permit(:plate, :color, :model, :year, :brand, :owner_id)
    end
end

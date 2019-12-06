class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    render json: @trips, status: :ok
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])
    render json: @trip, status: :ok
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
   
    if @trip.save
      render json: @trip, status: :ok
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])
   
    if @trip.update(trip_params)
      render json: @trip, status: :ok  
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
   
    if @trip.destroy
      render json: @trip, status: :ok  
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  private
    def trip_params
      params.require(:trip).permit(:lat_origin, :long_origin, :lat_destination, :long_destination, :price, :address_origin, :address_destination)
    end
end

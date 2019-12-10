class ContractsController < ApplicationController
    include ContractsHelper
  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all
    render json: @contracts, status: :ok
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])
    render json: @contract, status: :ok
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @user_own = User.find_by!(id_document: owner_params[:id_document])
    @owner = Owner.find_by!(user_id: @user_own.id)

    @user_rent = User.find_by!(id_document: rental_user_params[:id_document])
    @rental_user = RentalUser.find_by!(user_id: @user_rent.id)

    @car = Car.find_by!(plate: owner_params[:car_plate])

    @company = Company.find_by!(id: 1)
    
    price = calculate_price()
    actual_params = trip_params.merge(price: price)
    @trip = Trip.new(actual_params)
    @contract = @trip.build_contract(
                                car_id: @car.id, 
                                rental_user_id: @rental_user.id, 
                                company_id: 1)


    pdf_data = [@user_own, @user_rent, @car, @trip, @company]
    
    Trip.transaction do
      if @trip.save
        if @contract.save
            ContractMailer.contract_email(@user_own, pdf_data).deliver
            ContractMailer.contract_email(@user_rent, pdf_data).deliver
            render json: @contract, status: :ok
        else
          render json: @contract.errors, status: :unprocessable_entity
        end
      else
        render json: @trip.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])
   
    if @contract.update(contract_params)
      render json: @contract, status: :ok  
    else
      render json: @contract.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
   
    if @contract.destroy
      render json: @contract, status: :ok  
    else
      render json: @contract.errors, status: :unprocessable_entity
    end
  end

  private
    def calculate_distance()
        Geocoder.config()
        origin = [trip_params[:lat_origin], trip_params[:long_origin]]
        destination = [trip_params[:lat_destination], trip_params[:long_destination]]
        
        # transform to km
        Geocoder::Calculations.distance_between(origin, destination) * 1.60934
    end

    def calculate_price()
        distance = calculate_distance()

        # 1000 COP for each km
        distance * 1500
    end

    def owner_params
        params.require(:owner).permit(:id_document, :car_plate)
    end

    def rental_user_params
        params.require(:rental_user).permit(:id_document)
    end

    def trip_params
        params.require(:trip).permit(:lat_origin, 
                                     :long_origin, 
                                     :lat_destination, 
                                     :long_destination, 
                                     :address_origin, 
                                     :address_destination, 
                                     :price)
    end
end

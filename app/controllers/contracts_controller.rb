class ContractsController < ApplicationController
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
    @contract = Contract.new(contract_params)
   
    if @contract.save
      render json: @contract, status: :ok
    else
      render json: @contract.errors, status: :unprocessable_entity
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
    def contract_params
      params.require(:contract).permit(:car_id, :rental_contract_id, :trip_id, :company_id)
    end
end

class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    render json: @companies, status: :ok
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
    render json: @company, status: :ok
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
   
    if @company.save
      render json: @company, status: :ok
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
   
    if @company.update(company_params)
      render json: @company, status: :ok  
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company = Company.find(params[:id])
   
    if @company.destroy
      render json: @company, status: :ok  
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  private
    def company_params
      params.require(:company).permit(:name, :nit, :business_type)
    end
end

class ModifiedDocumentsController < ApplicationController
  # GET /modified_documents
  # GET /modified_documents.json
  def index
    @modified_documents = ModifiedDocument.all
    render json: @modified_documents, status: :ok
  end

  # GET /modified_documents/1
  # GET /modified_documents/1.json
  def show
    @modified_document = ModifiedDocument.find(params[:id])
    render json: @modified_document, status: :ok
  end

  # POST /modified_documents
  # POST /modified_documents.json
  def create
    @modified_document = ModifiedDocument.new(modified_document_params)
   
    if @modified_document.save
      render json: @modified_document, status: :ok
    else
      render json: @modified_document.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /modified_documents/1
  # PATCH/PUT /modified_documents/1.json
  def update
    @modified_document = ModifiedDocument.find(params[:id])
   
    if @modified_document.update(modified_document_params)
      render json: @modified_document, status: :ok  
    else
      render json: @modified_document.errors, status: :unprocessable_entity
    end
  end

  # DELETE /modified_documents/1
  # DELETE /modified_documents/1.json
  def destroy
    @modified_document = ModifiedDocument.find(params[:id])
   
    if @modified_document.destroy
      render json: @modified_document, status: :ok  
    else
      render json: @modified_document.errors, status: :unprocessable_entity
    end
  end

  private
    def modified_document_params
      params.require(:modified_document).permit(:price, :lat_destination, :long_destination)
    end
end

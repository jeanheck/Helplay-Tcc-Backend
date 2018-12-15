class IndividualidadesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_individualidade, only: [:show, :update, :destroy]

  # GET /individualidades
  def index
    if params[:atividade_id]
      @individualidades = Individualidade.where({atividade_id: params[:atividade_id]})
    else
      @individualidades = Individualidade.all
    end

    render json: @individualidades
  end

  # GET /individualidades/1
  def show
    render json: @individualidade
  end

  # POST /individualidades
  def create
    @individualidade = Individualidade.new(individualidade_params)

    if @individualidade.save
      render json: @individualidade, status: :created#, location: @individualidade
    else
      render json: @individualidade.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /individualidades/1
  def update
    if @individualidade.update(individualidade_params)
      render json: @individualidade
    else
      render json: @individualidade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /individualidades/1
  def destroy
    @individualidade.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individualidade
      @individualidade = Individualidade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def individualidade_params
      params.require(:individualidade).permit(:atividade_id, :caracteristica_id)
    end
end

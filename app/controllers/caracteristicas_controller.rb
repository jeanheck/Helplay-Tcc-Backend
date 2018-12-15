class CaracteristicasController < ApplicationController
  before_action :authenticate_user!

  before_action :set_esporte, only: [:show, :update]

  # GET esportes/:esporte_id/caracteristicas
  def index
    if params[:esporte_id]
      @esporte = Esporte.where({esporte_id: params[:esporte_id]})
    else
      @esporte = Esporte.all
    end

    render json: @esporte, include: :caracteristicas
  end

  # GET esportes/:esporte_id/caracteristicas/:caracteristica_id
  def show
    @caracteristica = Caracteristica.find(params[:id])

    render json: @caracteristica
  end

  # POST esportes/:esporte_id/caracteristicas/:caracteristica_id
  def create
    @caracteristica = Caracteristica.new(caracteristica_params)

    if @caracteristica.save
      render json: @caracteristica, status: :created#, location: esporte_caracteristica_path
    else
      render json: @caracteristica.errors, status: :unprocessable_entity
    end
  end

  # DELETE esportes/:esporte_id/caracteristicas/:caracteristica_id
  def destroy
    @caracteristica = Caracteristica.find(params[:id])

    @caracteristica.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esporte
      @caracteristicas = Esporte.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def caracteristica_params
      params.require(:caracteristica).permit(:descricao, :esporte_id, :inseridaPeloUsuario)
    end
end

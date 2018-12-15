class EsportesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_esporte, only: [:show]

  # GET /esportes
  def index
    @esporte = Esporte.all

    render json: @esporte, include: :caracteristicas
  end

  # GET /esportes/1
  def show
    render json: @esporte, include: :caracteristicas
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esporte
      @esporte = Esporte.find(params[:id])
    end
end

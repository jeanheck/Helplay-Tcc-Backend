class ParticipantesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_participante, only: [:show, :update, :destroy]

  # GET /participantes
  def index
    if params[:evento_id]
      @participantes = Participante.where({evento_id: params[:evento_id]})
    else
      @participantes = Participante.all
    end

    render json: @participantes, :include => { :usuario => { :include => { :atividades => { :include => { :esporte => {} } } } } }
  end

  # GET /participantes/1
  def show
    render json: @participante
  end

  # POST /participantes
  def create
    @participante = Participante.new(participante_params)

    if @participante.save
      render json: @participante, status: :created#, location: @participante
    else
      render json: @participante.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /participantes/1
  def update
    if @participante.update(participante_params)
      render json: @participante
    else
      render json: @participante.errors, status: :unprocessable_entity
    end
  end

  # DELETE /participantes/1
  def destroy
    @participante.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participante
      @participante = Participante.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def participante_params
      params.require(:participante).permit(:evento_id, :usuario_id)
    end
end

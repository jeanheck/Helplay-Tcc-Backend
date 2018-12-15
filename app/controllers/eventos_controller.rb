class EventosController < ApplicationController
  before_action :authenticate_user!

  before_action :set_evento, only: [:show, :update, :destroy]

  # GET /eventos
  def index
    if params[:usuario_id]
      @eventos = Evento.where({usuario_id: params[:usuario_id]})
    else
      @eventos = Evento.all
    end

    render json: @eventos, :include => { :usuario => {} , :participantes => {} }
  end

  # GET /eventos/1
  def show
    render json: @evento, :include => { :usuario => {} , :participantes => { :include => { :usuario => {} } } }
  end

  # POST /eventos
  def create
    @evento = Evento.new(evento_params)

    if @evento.save
      render json: @evento, status: :created, location: @evento
    else
      render json: @evento.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /eventos/1
  def update
    if @evento.update(evento_params)
      render json: @evento
    else
      render json: @evento.errors, status: :unprocessable_entity
    end
  end

  # DELETE /eventos/1
  def destroy
    @evento.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def evento_params
      params.require(:evento).permit(:descricao, :local, :dataHora, :informacoes, :publico, :usuario_id)
    end
end

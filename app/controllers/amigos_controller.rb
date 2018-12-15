class AmigosController < ApplicationController
  before_action :authenticate_user!

  before_action :set_amigo, only: [:show, :update, :destroy]

  # GET /amigos
  def index
    if params[:usuario_id]
      @amigos = Amigo.where("usuarioUm_id = ? OR usuarioDois_id = ?", params[:usuario_id], params[:usuario_id])
    else
      @amigos = Amigo.all
    end

    render json: @amigos, :include => { :usuarioUm => { :include => { :atividades => { :include => { :esporte => {} } } } }, :usuarioDois => { :include => { :atividades => { :include => { :esporte => {} } } } }, }
  end

  # GET /amigos/1
  def show
    render json: @amigo
  end

  # POST /amigos
  def create
    @amigo = Amigo.new(amigo_params)

    if @amigo.save
      render json: @amigo, status: :created, location: usuario_amigos_path
    else
      render json: @amigo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /amigos/1
  def update
    if @amigo.update(amigo_params)
      render json: @amigo
    else
      render json: @amigo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /amigos/1
  def destroy
    @amigo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amigo
      @amigo = Amigo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def amigo_params
      params.require(:amigo).permit(:usuarioUm_id, :usuarioDois_id)
    end
end

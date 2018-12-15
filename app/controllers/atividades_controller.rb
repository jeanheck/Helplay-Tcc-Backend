class AtividadesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_atividade, only: [:show, :update, :destroy]

  # GET /atividades
  def index
    if params[:usuario_id]
      @atividades = Atividade.where({usuario_id: params[:usuario_id]})
    else
      @atividades = Atividade.all
    end

    render json: @atividades, :include => { :individualidades => {:include => { :caracteristica => {} } }, :esporte => {only: [:id, :nome]}, :usuario => {only: [:id, :nome, :dataNascimento, :sexo, :user_id, :celular]} }
  end

  # GET /atividades/1
  def show
    render json: @atividade, include: :individualidades
  end

  # POST /atividades
  def create
    @atividade = Atividade.new(atividade_params)

    if @atividade.save
      render json: @atividade, include: :individualidades, status: :created, location: usuario_atividades_url
    else
      render json: @atividade.errors, status: :unprocessable_entity
    end
  end

  def create
      @atividades_salvas = []

      params[:atividades].each do |atividade|
          atividade_new = Atividade.new(atividade_params(atividade))

          if atividade_new.save
            @atividades_salvas << atividade_new
          else
            render json: atividade_new.errors, status: :unprocessable_entity
          end
      end

      render json: @atividades_salvas, include: :individualidades, status: :created, location: usuario_atividades_url
  end

  # PATCH/PUT /atividades/1
  def update
    if @atividade.update(atividade_params)
      render json: @atividade, include: :individualidades, location: usuario_atividades_url
    else
      render json: @atividade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /atividades/1
  def destroy
    @atividade.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atividade
      @atividade = Atividade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def atividade_params
    #   params.require(:atividade).permit(:esporte_id, :usuario_id, individualidades_attributes: [:id, :caracteristica, :_destroy])
    # end

    def atividade_params(atividade)
      atividade.require(:atividade).permit(:esporte_id, :usuario_id, individualidades_attributes: [:id, :caracteristica_id, :_destroy])
    end
end

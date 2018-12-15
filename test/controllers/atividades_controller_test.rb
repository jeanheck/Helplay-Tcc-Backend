require 'test_helper'

class AtividadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atividade = atividades(:one)
  end

  test "should get index" do
    get atividades_url, as: :json
    assert_response :success
  end

  test "should create atividade" do
    assert_difference('Atividade.count') do
      post atividades_url, params: { atividade: { esporte_id: @atividade.esporte_id, usuario_id: @atividade.usuario_id } }, as: :json
    end

    assert_response 201
  end

  test "should show atividade" do
    get atividade_url(@atividade), as: :json
    assert_response :success
  end

  test "should update atividade" do
    patch atividade_url(@atividade), params: { atividade: { esporte_id: @atividade.esporte_id, usuario_id: @atividade.usuario_id } }, as: :json
    assert_response 200
  end

  test "should destroy atividade" do
    assert_difference('Atividade.count', -1) do
      delete atividade_url(@atividade), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class IndividualidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @individualidade = individualidades(:one)
  end

  test "should get index" do
    get individualidades_url, as: :json
    assert_response :success
  end

  test "should create individualidade" do
    assert_difference('Individualidade.count') do
      post individualidades_url, params: { individualidade: { atividade_id: @individualidade.atividade_id, caracteristica: @individualidade.caracteristica } }, as: :json
    end

    assert_response 201
  end

  test "should show individualidade" do
    get individualidade_url(@individualidade), as: :json
    assert_response :success
  end

  test "should update individualidade" do
    patch individualidade_url(@individualidade), params: { individualidade: { atividade_id: @individualidade.atividade_id, caracteristica: @individualidade.caracteristica } }, as: :json
    assert_response 200
  end

  test "should destroy individualidade" do
    assert_difference('Individualidade.count', -1) do
      delete individualidade_url(@individualidade), as: :json
    end

    assert_response 204
  end
end

require 'test_helper'

class AmigosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amigo = amigos(:one)
  end

  test "should get index" do
    get amigos_url, as: :json
    assert_response :success
  end

  test "should create amigo" do
    assert_difference('Amigo.count') do
      post amigos_url, params: { amigo: { usuarioDois_id: @amigo.usuarioDois_id, usuarioUm_id: @amigo.usuarioUm_id } }, as: :json
    end

    assert_response 201
  end

  test "should show amigo" do
    get amigo_url(@amigo), as: :json
    assert_response :success
  end

  test "should update amigo" do
    patch amigo_url(@amigo), params: { amigo: { usuarioDois_id: @amigo.usuarioDois_id, usuarioUm_id: @amigo.usuarioUm_id } }, as: :json
    assert_response 200
  end

  test "should destroy amigo" do
    assert_difference('Amigo.count', -1) do
      delete amigo_url(@amigo), as: :json
    end

    assert_response 204
  end
end

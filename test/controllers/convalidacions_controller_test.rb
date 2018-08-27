require 'test_helper'

class ConvalidacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @convalidacion = convalidacions(:one)
  end

  test "should get index" do
    get convalidacions_url
    assert_response :success
  end

  test "should get new" do
    get new_convalidacion_url
    assert_response :success
  end

  test "should create convalidacion" do
    assert_difference('Convalidacion.count') do
      post convalidacions_url, params: { convalidacion: { asignatura_id: @convalidacion.asignatura_id, convalida: @convalidacion.convalida } }
    end

    assert_redirected_to convalidacion_url(Convalidacion.last)
  end

  test "should show convalidacion" do
    get convalidacion_url(@convalidacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_convalidacion_url(@convalidacion)
    assert_response :success
  end

  test "should update convalidacion" do
    patch convalidacion_url(@convalidacion), params: { convalidacion: { asignatura_id: @convalidacion.asignatura_id, convalida: @convalidacion.convalida } }
    assert_redirected_to convalidacion_url(@convalidacion)
  end

  test "should destroy convalidacion" do
    assert_difference('Convalidacion.count', -1) do
      delete convalidacion_url(@convalidacion)
    end

    assert_redirected_to convalidacions_url
  end
end

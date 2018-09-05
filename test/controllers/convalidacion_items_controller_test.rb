require 'test_helper'

class ConvalidacionItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @convalidacion_item = convalidacion_items(:one)
  end

  test "should get index" do
    get convalidacion_items_url
    assert_response :success
  end

  test "should get new" do
    get new_convalidacion_item_url
    assert_response :success
  end

  test "should create convalidacion_item" do
    assert_difference('ConvalidacionItem.count') do
      post convalidacion_items_url, params: { convalidacion_item: { asignatura_local_clave: @convalidacion_item.asignatura_local_clave, asignatura_local_creditos: @convalidacion_item.asignatura_local_creditos, asignatura_local_nombre: @convalidacion_item.asignatura_local_nombre, asignatura_procedencia_calificacion: @convalidacion_item.asignatura_procedencia_calificacion, asignatura_procedencia_clave: @convalidacion_item.asignatura_procedencia_clave, asignatura_procedencia_creditos: @convalidacion_item.asignatura_procedencia_creditos, asignatura_procedencia_nombre: @convalidacion_item.asignatura_procedencia_nombre, asignaturas_id: @convalidacion_item.asignaturas_id, convalidacions_id: @convalidacion_item.convalidacions_id } }
    end

    assert_redirected_to convalidacion_item_url(ConvalidacionItem.last)
  end

  test "should show convalidacion_item" do
    get convalidacion_item_url(@convalidacion_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_convalidacion_item_url(@convalidacion_item)
    assert_response :success
  end

  test "should update convalidacion_item" do
    patch convalidacion_item_url(@convalidacion_item), params: { convalidacion_item: { asignatura_local_clave: @convalidacion_item.asignatura_local_clave, asignatura_local_creditos: @convalidacion_item.asignatura_local_creditos, asignatura_local_nombre: @convalidacion_item.asignatura_local_nombre, asignatura_procedencia_calificacion: @convalidacion_item.asignatura_procedencia_calificacion, asignatura_procedencia_clave: @convalidacion_item.asignatura_procedencia_clave, asignatura_procedencia_creditos: @convalidacion_item.asignatura_procedencia_creditos, asignatura_procedencia_nombre: @convalidacion_item.asignatura_procedencia_nombre, asignaturas_id: @convalidacion_item.asignaturas_id, convalidacions_id: @convalidacion_item.convalidacions_id } }
    assert_redirected_to convalidacion_item_url(@convalidacion_item)
  end

  test "should destroy convalidacion_item" do
    assert_difference('ConvalidacionItem.count', -1) do
      delete convalidacion_item_url(@convalidacion_item)
    end

    assert_redirected_to convalidacion_items_url
  end
end

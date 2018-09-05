require "application_system_test_case"

class ConvalidacionItemsTest < ApplicationSystemTestCase
  setup do
    @convalidacion_item = convalidacion_items(:one)
  end

  test "visiting the index" do
    visit convalidacion_items_url
    assert_selector "h1", text: "Convalidacion Items"
  end

  test "creating a Convalidacion item" do
    visit convalidacion_items_url
    click_on "New Convalidacion Item"

    fill_in "Asignatura Local Clave", with: @convalidacion_item.asignatura_local_clave
    fill_in "Asignatura Local Creditos", with: @convalidacion_item.asignatura_local_creditos
    fill_in "Asignatura Local Nombre", with: @convalidacion_item.asignatura_local_nombre
    fill_in "Asignatura Procedencia Calificacion", with: @convalidacion_item.asignatura_procedencia_calificacion
    fill_in "Asignatura Procedencia Clave", with: @convalidacion_item.asignatura_procedencia_clave
    fill_in "Asignatura Procedencia Creditos", with: @convalidacion_item.asignatura_procedencia_creditos
    fill_in "Asignatura Procedencia Nombre", with: @convalidacion_item.asignatura_procedencia_nombre
    fill_in "Asignaturas", with: @convalidacion_item.asignaturas_id
    fill_in "Convalidacions", with: @convalidacion_item.convalidacions_id
    click_on "Create Convalidacion item"

    assert_text "Convalidacion item was successfully created"
    click_on "Back"
  end

  test "updating a Convalidacion item" do
    visit convalidacion_items_url
    click_on "Edit", match: :first

    fill_in "Asignatura Local Clave", with: @convalidacion_item.asignatura_local_clave
    fill_in "Asignatura Local Creditos", with: @convalidacion_item.asignatura_local_creditos
    fill_in "Asignatura Local Nombre", with: @convalidacion_item.asignatura_local_nombre
    fill_in "Asignatura Procedencia Calificacion", with: @convalidacion_item.asignatura_procedencia_calificacion
    fill_in "Asignatura Procedencia Clave", with: @convalidacion_item.asignatura_procedencia_clave
    fill_in "Asignatura Procedencia Creditos", with: @convalidacion_item.asignatura_procedencia_creditos
    fill_in "Asignatura Procedencia Nombre", with: @convalidacion_item.asignatura_procedencia_nombre
    fill_in "Asignaturas", with: @convalidacion_item.asignaturas_id
    fill_in "Convalidacions", with: @convalidacion_item.convalidacions_id
    click_on "Update Convalidacion item"

    assert_text "Convalidacion item was successfully updated"
    click_on "Back"
  end

  test "destroying a Convalidacion item" do
    visit convalidacion_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Convalidacion item was successfully destroyed"
  end
end

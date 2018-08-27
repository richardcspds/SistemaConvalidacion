require "application_system_test_case"

class EstudiantesTest < ApplicationSystemTestCase
  setup do
    @estudiante = estudiantes(:one)
  end

  test "visiting the index" do
    visit estudiantes_url
    assert_selector "h1", text: "Estudiantes"
  end

  test "creating a Estudiante" do
    visit estudiantes_url
    click_on "New Estudiante"

    fill_in "Carrera", with: @estudiante.carrera_id
    fill_in "Correo", with: @estudiante.correo
    fill_in "Matricula", with: @estudiante.matricula
    fill_in "Nombre", with: @estudiante.nombre
    fill_in "Persona", with: @estudiante.persona_id
    fill_in "Telefono", with: @estudiante.telefono
    click_on "Create Estudiante"

    assert_text "Estudiante was successfully created"
    click_on "Back"
  end

  test "updating a Estudiante" do
    visit estudiantes_url
    click_on "Edit", match: :first

    fill_in "Carrera", with: @estudiante.carrera_id
    fill_in "Correo", with: @estudiante.correo
    fill_in "Matricula", with: @estudiante.matricula
    fill_in "Nombre", with: @estudiante.nombre
    fill_in "Persona", with: @estudiante.persona_id
    fill_in "Telefono", with: @estudiante.telefono
    click_on "Update Estudiante"

    assert_text "Estudiante was successfully updated"
    click_on "Back"
  end

  test "destroying a Estudiante" do
    visit estudiantes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estudiante was successfully destroyed"
  end
end

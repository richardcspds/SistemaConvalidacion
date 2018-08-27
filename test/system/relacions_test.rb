require "application_system_test_case"

class RelacionsTest < ApplicationSystemTestCase
  setup do
    @relacion = relacions(:one)
  end

  test "visiting the index" do
    visit relacions_url
    assert_selector "h1", text: "Relacions"
  end

  test "creating a Relacion" do
    visit relacions_url
    click_on "New Relacion"

    fill_in "Asignatura", with: @relacion.asignatura
    fill_in "Convalida", with: @relacion.convalida
    click_on "Create Relacion"

    assert_text "Relacion was successfully created"
    click_on "Back"
  end

  test "updating a Relacion" do
    visit relacions_url
    click_on "Edit", match: :first

    fill_in "Asignatura", with: @relacion.asignatura
    fill_in "Convalida", with: @relacion.convalida
    click_on "Update Relacion"

    assert_text "Relacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Relacion" do
    visit relacions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Relacion was successfully destroyed"
  end
end

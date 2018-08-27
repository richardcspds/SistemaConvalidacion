require "application_system_test_case"

class ConvalidacionsTest < ApplicationSystemTestCase
  setup do
    @convalidacion = convalidacions(:one)
  end

  test "visiting the index" do
    visit convalidacions_url
    assert_selector "h1", text: "Convalidacions"
  end

  test "creating a Convalidacion" do
    visit convalidacions_url
    click_on "New Convalidacion"

    fill_in "Asignatura", with: @convalidacion.asignatura_id
    fill_in "Convalida", with: @convalidacion.convalida
    click_on "Create Convalidacion"

    assert_text "Convalidacion was successfully created"
    click_on "Back"
  end

  test "updating a Convalidacion" do
    visit convalidacions_url
    click_on "Edit", match: :first

    fill_in "Asignatura", with: @convalidacion.asignatura_id
    fill_in "Convalida", with: @convalidacion.convalida
    click_on "Update Convalidacion"

    assert_text "Convalidacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Convalidacion" do
    visit convalidacions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Convalidacion was successfully destroyed"
  end
end

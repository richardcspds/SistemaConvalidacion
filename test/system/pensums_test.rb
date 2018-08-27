require "application_system_test_case"

class PensumsTest < ApplicationSystemTestCase
  setup do
    @pensum = pensums(:one)
  end

  test "visiting the index" do
    visit pensums_url
    assert_selector "h1", text: "Pensums"
  end

  test "creating a Pensum" do
    visit pensums_url
    click_on "New Pensum"

    fill_in "Carrera", with: @pensum.carrera_id
    fill_in "Date", with: @pensum.date
    fill_in "Nombre", with: @pensum.nombre
    click_on "Create Pensum"

    assert_text "Pensum was successfully created"
    click_on "Back"
  end

  test "updating a Pensum" do
    visit pensums_url
    click_on "Edit", match: :first

    fill_in "Carrera", with: @pensum.carrera_id
    fill_in "Date", with: @pensum.date
    fill_in "Nombre", with: @pensum.nombre
    click_on "Update Pensum"

    assert_text "Pensum was successfully updated"
    click_on "Back"
  end

  test "destroying a Pensum" do
    visit pensums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pensum was successfully destroyed"
  end
end

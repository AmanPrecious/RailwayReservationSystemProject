require "application_system_test_case"

class TrainsTest < ApplicationSystemTestCase
  setup do
    @train = trains(:one)
  end

  test "visiting the index" do
    visit trains_url
    assert_selector "h1", text: "Trains"
  end

  test "should create train" do
    visit trains_url
    click_on "New train"

    fill_in "Arrival time", with: @train.arrival_time
    fill_in "Departure time", with: @train.departure_time
    fill_in "Destination station", with: @train.destination_station
    fill_in "Source station", with: @train.source_station
    fill_in "Train name", with: @train.train_name
    fill_in "Train number", with: @train.train_number
    click_on "Create Train"

    assert_text "Train was successfully created"
    click_on "Back"
  end

  test "should update Train" do
    visit train_url(@train)
    click_on "Edit this train", match: :first

    fill_in "Arrival time", with: @train.arrival_time
    fill_in "Departure time", with: @train.departure_time
    fill_in "Destination station", with: @train.destination_station
    fill_in "Source station", with: @train.source_station
    fill_in "Train name", with: @train.train_name
    fill_in "Train number", with: @train.train_number
    click_on "Update Train"

    assert_text "Train was successfully updated"
    click_on "Back"
  end

  test "should destroy Train" do
    visit train_url(@train)
    click_on "Destroy this train", match: :first

    assert_text "Train was successfully destroyed"
  end
end

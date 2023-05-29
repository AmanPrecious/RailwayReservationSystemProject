require "test_helper"

class TrainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @train = trains(:one)
  end

  test "should get index" do
    get trains_url
    assert_response :success
  end

  test "should get new" do
    get new_train_url
    assert_response :success
  end

  test "should create train" do
    assert_difference("Train.count") do
      post trains_url, params: { train: { arrival_time: @train.arrival_time, departure_time: @train.departure_time, destination_station: @train.destination_station, source_station: @train.source_station, train_name: @train.train_name, train_number: @train.train_number } }
    end

    assert_redirected_to train_url(Train.last)
  end

  test "should show train" do
    get train_url(@train)
    assert_response :success
  end

  test "should get edit" do
    get edit_train_url(@train)
    assert_response :success
  end

  test "should update train" do
    patch train_url(@train), params: { train: { arrival_time: @train.arrival_time, departure_time: @train.departure_time, destination_station: @train.destination_station, source_station: @train.source_station, train_name: @train.train_name, train_number: @train.train_number } }
    assert_redirected_to train_url(@train)
  end

  test "should destroy train" do
    assert_difference("Train.count", -1) do
      delete train_url(@train)
    end

    assert_redirected_to trains_url
  end
end

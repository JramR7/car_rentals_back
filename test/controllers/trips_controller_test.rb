require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post trips_url, params: { trip: { address_destination: @trip.address_destination, address_origin: @trip.address_origin, lat_destination: @trip.lat_destination, lat_origin: @trip.lat_origin, long_destination: @trip.long_destination, long_origin: @trip.long_origin, price: @trip.price } }
    end

    assert_redirected_to trip_url(Trip.last)
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { address_destination: @trip.address_destination, address_origin: @trip.address_origin, lat_destination: @trip.lat_destination, lat_origin: @trip.lat_origin, long_destination: @trip.long_destination, long_origin: @trip.long_origin, price: @trip.price } }
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete trip_url(@trip)
    end

    assert_redirected_to trips_url
  end
end

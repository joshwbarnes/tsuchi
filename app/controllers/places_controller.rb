# This makes a call to the Google Places API
class PlacesController < ApplicationController
  def call
    url = "https://maps.googleapis.com/maps/api/js?key=#{ENV['GOOGLE_MAPS_KEY']}&callback=initMap&libraries=&v=weekly"
    response = RestClient.get(url)
    render response.body
  end
end

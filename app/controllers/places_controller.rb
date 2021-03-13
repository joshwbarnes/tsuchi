# This makes a call to the Google Places API
class PlacesController < ApplicationController
  def call
    # Nearby shop radius in metres
    radius = 500
    domain_and_path = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
    query_string = "location=#{params[:lat]},#{params[:long]}&radius=#{radius}&types=#{params[:category]}&key=#{ENV['PLACES_API_KEY']}"
    url = "#{domain_and_path}?#{query_string}"
    p url
    response = RestClient.get(url)
    render json: response.body
  end
end

# This makes a call to the Google Places API
class PlacesController < ApplicationController
  def call
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{params[:lat]},#{params[:long]}&radius=500&types=book_store&key=#{ENV['PLACES_API_KEY']}"

    response = RestClient.get(url)

    render json: response.body
  end
end

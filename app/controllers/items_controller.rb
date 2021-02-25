# Controller for items
class ItemsController < ApplicationController
  def show
    @user = current.user
    @markers =
      {
        lat: @user.geocoded.map.latitude,
        lng: @user.geocoded.map.longitude
      }
  end
end

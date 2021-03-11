class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :index

  def home
  end


  def dashboard
    @user = current_user
  end


  def about
  end

end

class PagesController < ApplicationController
before_action :authenticate_user!, only: :dashboard

  def home
  end

  def index
  end

  def dashboard
    @user = current_user
  end

  def about
  end
end

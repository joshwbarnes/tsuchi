class ItemsController < ApplicationController
  before_action :set_item, only:[ :show, :destroy ]
  def index
    @items = item.all
  end

  def show; end
  end

  def new
    @item = Item.new
  end

  def destroy
    @item.destroy
    redietct_to list_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end

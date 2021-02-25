class ItemsController < ApplicationController
  before_action :set_item, only:[ :show, :destroy ]

  def show
  end

  def create
    @item = Item.new(item_params)
    @list = List.find(params[:list_id])
    @item.list = @list

    if @item.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end


  def update
    @item.update(item_params)
    redirect_to list_path(@item.list)
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end
 def item_params
   params.require(:item).permit()
  end


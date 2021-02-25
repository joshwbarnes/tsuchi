class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def show; end

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

  def edit; end

  def update
    @item.update(item_params)
    redirect_to list_path(@item.list)
  end

  def destroy
    @item.delete
    redirect_to items_path, notice: 'Deleted!'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
 def item_params
    params.require(:item).permit(:name, :item_category, :quantity, :completed, :notification)
  end
end

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def show
    @nearby = params[:nearby]
  end

  def create
    @item = Item.new(item_params)
    @list = List.find(params[:list_id])
    if params[:optional] != "true"
    @item.list = @list
    end
    @user = current_user
    @item.user = @user
    if @item.save
      if params[:optional] == "true"
        redirect_to list_path(@list)
      else
        redirect_to list_path(@list, list_id: params[:list_id])
      end

    else
      @lists = List.all
      @items = Item.where(list_id: params[:list_id])
      render "lists/show"
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

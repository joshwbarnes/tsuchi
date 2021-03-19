class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def show
    @nearby = params[:nearby]
  end

  def create
    @my_list = List.find(params[:item][:my_list])
    if !params[:list_id]
      @other_list = List.find(params[:item][:other_list])
    end

    @item = Item.new(item_params)
    @list = List.find(params[:list_id])
    if params[:optional] != 'true'
      @item.list = @list
    end
    @user = current_user
    @item.user = @user
    if @item.save
      if params[:optional] == "true"
        redirect_to list_path(@list)
      elsif
        redirect_to list_path(@list, list_id: params[:list_id])
      else
        redirect_to request.referer
      end
    else
      @new_form = true
      @item_new = @item
      @lists = List.all
      @items = Item.where(list_id: params[:list_id])
      render 'lists/show'
    end
  end

  def edit; end

  def update
    @item.update(item_params)
    if params[:optional] == 'true'
      redirect_to list_path(@list)
    else
      redirect_to list_path(@item.list, list_id: params[:list_id])
    end
  end

  def destroy
    @item.destroy
    redirect_to list_path(set_list,list_id: params[:list_id]), notice: 'Deleted!'
  end

  def update_notification
    set_item
    if @item.notification
     @item.update_attributes(notification: false)
    else
     @item.update_attributes(notification: true)
    end
     redirect_to request.referer
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_list
    List.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:name, :item_category, :quantity, :completed, :notification)
  end
end

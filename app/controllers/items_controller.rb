class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = policy_scope(Item).order(created_at: :desc)
  end

  def show; end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item

    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Deleted!'
  end

  private
    def item_params
      params.require(:item).permit(:name, :item_category, :quantity, :completed, :notification)
    end

    def set_item
      @item = Item.find(params[:id])
      authorize @item
    end
end

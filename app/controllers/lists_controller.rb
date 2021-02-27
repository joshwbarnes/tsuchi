class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def show
    @lists = List.order(:id)
     #authorize @list
    if params[:list_id]
      @items = Item.where(list_id: params[:list_id])
    else
      @items = Item.all
    end
      @item = Item.new
      @form = params[:new]
  end

  def new
    @list = List.new
     #authorize @list
  end

def create
  @list = List.new(list_params)
  #authorize @list
  if @list.save
    redirect_to list_path(@list, list_id: params[:list_id])
  else
    render :new
  end
end

  def edit
    @list = set_list

    #authorize @list
  end

  def update
    @list = set_list
    #authorize @list
    @list.update(list_params)
    redirect_to list_path(@list)
  end

def destroy
  @list.delete
  redirect_to list_path(@list)
end

private

def list_params
  params.require(:list).permit(:name, :due_date)
end

  def set_list
    @list = List.find(params[:id])
  end
end

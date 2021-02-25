class ListsController < ApplicationController
  before_action :find_list, only: [:show]

  def show
     @lists = List.all
     #authorize @list
     @items = Item.all
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
    redirect_to list_path(@list)
    else
    render :new
    end
  end

  def edit
    @list = find_list
    #authorize @list
  end

  def update
    @list = find_list
    #authorize @list
    @list.update(list_params)
  end

  def delete
    @item.destroy
    redietct_to list_path
  end

  private

  def list_params
    params.require(:list_params).permit(:name, :due_date(1i), :due_date(2i), :due_date(3i))

  end

  def find_list
  @list = List.find(params[:id])
  end
end

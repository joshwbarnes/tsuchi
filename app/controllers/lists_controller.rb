class ListsController < ApplicationController



  def index
    @lists = List.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def list_params
  params.require(:list_params).permit(:name)
  end

  def find_list
  @list = List.find(params[:id])
  end

end

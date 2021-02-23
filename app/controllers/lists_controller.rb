class ListsController < ApplicationController
  def index
    @lists = policy_scope(List).order(created_at: :desc)
  end

  def show
     authorize @list
  end

  def new
    @list = List.new
     authorize @list
  end

  def create
    @list = List.new(list_params)
     authorize @list
    if @list.save
    redirect_to list_path(@list)
    else
    render :new
    end
  end

  def edit
    @list = find_list
    authorize @list
  end

  def update
    @list = find_list
    authorize @list
    @list.update(list_params)
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

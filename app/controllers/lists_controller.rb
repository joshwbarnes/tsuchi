class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

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
  authorize @list
end

def update
  authorize @list
  @list.update(list_params)
end

def delete
  @list.destroy
  redirect_to lists_path
end

private

def list_params
  params.require(:list).permit(:name, :due_date)
end

  def set_list
    @list = List.find(params[:id])
  end
end

class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy, :share]

  def show
    @lists = current_user.lists.order(:id)
     #authorize @list
    if params[:list_id]
      @items = Item.where(list_id: params[:list_id]).order(created_at: :desc)
    else
      @items = Item.all.order(created_at: :desc)
    end
      @item = Item.new
      @new_form = params[:new]
      @edit_form = params[:edit]

  end

  def new
    @list = List.new
     #authorize @list
  end

def create
  @list = List.new(list_params)
  #authorize @list
  if @list.save
    @user_list = UserList.new(list_id: @list.id, user_id: current_user.id)
    @user_list.save
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
  # @user_list = User_List.find(params[:list_id])
  # @list.user_list = @user_list
  @list.destroy
  if current_user.lists.count != 0
  redirect_to list_path(current_user.lists[0])
  else
  redirect_to new_list_path
  end

  def share
  @user = User.where(:email)
  UserList.new(list_id: @list.id, user_id: @user.id)
  end

end

private

def list_params
  params.require(:list).permit(:name, :due_date)
end

  def set_list
    @list = List.find(params[:id])
  end
end

class UserListsController < ApplicationController
  def create
    @user_lists = UserList.new
    @list = List.find(params[:list_id])
    @user_lists.list = @list
    @email = params[:user_list][:user]
    @user_lists.share(@email)
    if @user_lists.save
      flash[:notice] = "Invited buddy"
      redirect_to list_path(@list.id)
    else
      @lists = current_user.lists.order(:id)
      @items = Item.all.order(created_at: :desc)
      flash[:alert] = "This buddy is not exist"
      render "lists/show"
    end
  end
end

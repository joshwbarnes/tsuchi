class UserList < ApplicationRecord
  belongs_to :user
  belongs_to :list

  def share
    @user = User.find_by(email: ())
    UserList.new(list_id: @list.id, user_id: @user.id)
  end

end

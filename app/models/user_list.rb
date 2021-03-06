class UserList < ApplicationRecord
  belongs_to :user
  belongs_to :list

  def share(email)
    @buddy = User.find_by(email:email)
    if @buddy
      self.user = @buddy
    end
  end

end

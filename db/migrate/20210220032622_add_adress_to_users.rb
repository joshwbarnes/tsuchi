class AddAdressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mobile_number, :integer
    add_column :users, :address, :string
  end
end

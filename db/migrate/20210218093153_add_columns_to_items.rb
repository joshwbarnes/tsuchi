class AddColumnsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :name, :string
    add_column :items, :item_category, :string
    add_column :items, :quantity, :integer
    add_column :items, :completed, :boolean, :default => false
    add_column :items, :notification, :boolean, :deault => true
    add_reference :items, :lists, foreign_key: true
  end
end

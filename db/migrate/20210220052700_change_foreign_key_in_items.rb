class ChangeForeignKeyInItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :lists_id, :list_id
  end
end

class Item < ApplicationRecord
  belongs_to :list

  validates [:name, :item_category], presence: true
end

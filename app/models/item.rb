class Item < ApplicationRecord
  belongs_to :list

  validates :name, presence: true
  validates :item_category, presence: true
end

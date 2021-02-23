class Item < ApplicationRecord
  belongs_to :list
  belongs_to :user

  validates :name, presence: true
  validates :item_category, presence: true
end

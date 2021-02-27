class Item < ApplicationRecord
  belongs_to :list, optional: true
  belongs_to :user

  validates :name, presence: true
  validates :item_category, presence: true
end

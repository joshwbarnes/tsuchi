class Item < ApplicationRecord
  belongs_to :list, optional: true
  belongs_to :user

  validates :name, presence: true
  validates :item_category, presence: true

  attribute :notification, :boolean, default: true
  CATEGORIES = [
  'book_store',
  'clothing_store',
  'convenience_store',
  'dentist',
  'plumber',
  'shopping_mall',
  'liquor_store',
  'museum'
]
end

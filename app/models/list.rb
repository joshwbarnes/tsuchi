class List < ApplicationRecord
  has_many :user_lists
  has_many :items, dependent: :destroy

  validates :name, presence: true
end

class List < ApplicationRecord
  has_many :user_lists, dependent: :destroy
  has_many :items, dependent: :destroy

  validates :name, presence: true
end

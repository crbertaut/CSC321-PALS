class Organization < ApplicationRecord
  has_many :users
  validates :name, uniqueness: true
  validates :name, presence: true
end

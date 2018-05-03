class Organization < ApplicationRecord
  acts_as :user
  
  has_many :people
  
  validates :phone, presence: true
  validates :phone, uniqueness: true
end

class Donation < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :organization, optional: true
    
    validates :amount, presence: true
    validates :date, presence: true
end

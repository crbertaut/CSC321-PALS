class User < ApplicationRecord
    has_many :interests
    
    validates :name, presence: 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX }, 
        uniqueness: { case_sensitive: false }
    validates :phone, presence: true, length: { is: 10 }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        # :confirmable
         
         
  validates :username,uniqueness: true
  
  has_many :posts
  has_and_belongs_to_many :interests
end

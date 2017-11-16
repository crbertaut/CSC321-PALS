class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        # :confirmable
         
<<<<<<< HEAD
  has_many :posts
=======
  has_and_belongs_to_many :interests
>>>>>>> cfd7d98ba2e62bf86b97cd933615e0f658b590a8
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  
  def firstname
  end
  
  def lastname
  end
  
  def dob
  end
  
  def age
  end
  
  def phone
  end
  
  def email
  end
  
  def interests
  end
end

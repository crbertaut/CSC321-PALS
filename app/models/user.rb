class User < ApplicationRecord
  actable
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        # :confirmable
        
  enum contact_method: [:phone, :email]
  has_many :donations
         
  validates :email, uniqueness: true, allow_nil: false
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :city, format: { with: /\A[a-zA-Z]+\z/ }, allow_blank: true
  validates :state, format: { with: /\A[a-zA-Z]{2}\z/ }, allow_blank: true
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  def will_save_change_to_email?
    false
  end
end

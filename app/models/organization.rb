class Organization < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        # :confirmable
         
  has_many :users
  has_many :donations
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :phone, presence: true
  validates :phone, uniqueness: true
  
  has_attached_file :avatar, styles: { medium: "180x180>", thumb: "50x50>" }, default_url: "/assets/blank-avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end

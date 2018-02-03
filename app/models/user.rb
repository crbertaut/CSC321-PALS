class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        # :confirmable
         
  attr_accessor :other_interests         
  validates :username, uniqueness: true
  
  has_attached_file :avatar, styles: { medium: "180x180>", thumb: "50x50>" }, default_url: "/assets/blank-avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  has_many :posts
  has_and_belongs_to_many :interests
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
end

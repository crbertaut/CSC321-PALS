class Person < ApplicationRecord
  acts_as :user
  
  enum gender: [:male, :female, :other, :prefer_not_to_disclose]
  
  attr_accessor :other_interests
  
  validates :other_gender, presence: true, if: Proc.new {|u| u.other?}
  validate :different_home_work_phone, :home_or_work_phone
  
  has_attached_file :avatar, styles: { medium: "180x180>", thumb: "50x50>" }, default_url: "/assets/blank-avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  has_and_belongs_to_many :interests
  belongs_to :organization, optional: true
  has_many :shifts
  
  def different_home_work_phone
    errors.add(:home_phone) if home_phone == work_phone
  end
  
  def home_or_work_phone
    errors.add(:home_phone) if home_phone.blank? and work_phone.blank?
  end
end
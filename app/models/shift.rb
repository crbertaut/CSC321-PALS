class Shift < ApplicationRecord
  belongs_to :user
  
  enum kind: [:dog_shift, :cat_shift]
  # TODO: expand shift types
  
  validates :user, presence: true
  validates :kind, presence: true
  validates :start, presence: true
  validates :finish, presence: true
  validate :start_before_finish
  
  def start_before_finish
    errors.add(:start, "must be before finish") unless start < finish
  end
end

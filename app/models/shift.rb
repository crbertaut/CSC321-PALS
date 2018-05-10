class Shift < ApplicationRecord
  belongs_to :user
  
  enum kind: [:dog_walking, :dog_cleaning, :cat_walking, :cat_cleaning]
  # TODO: expand shift types
  
  validates :user, presence: true
  validates :kind, presence: true
  validates :start, presence: true
  validates :finish, presence: true
  validate :start_before_finish
  
  def start_before_finish
    #errors.add(:start, "must be before finish") unless start < finish
  end
  
  require 'csv'
  
  def self.import(file)
    puts "***Importing***"
    CSV.foreach(file.path, headers: true) do |row|
      
      if row['First Name'] != NIL
        curr_name = row['First Name'] + " " + row['Last Name']
        users = User.where(name: curr_name)
        user = NIL;
        email = User.where(home_email: row['Email'])
        
        if users.empty? && email.empty?
          user = User.create!(name: curr_name, 
          home_email: email = row['Email'],
          password: 'password',
          home_phone: '(000) 000-0000')
        elsif !users.empty? 
          user = users.first
        end
        
        startTime = row['Start Date/Time (mm/dd/yyyy)']
        finishTime = row['End Date/Time (mm/dd/yyyy)']

        #if !user.nil? && !startTime.blank? && !finishTime.blank? && !startTime.nil? && !finishTime.nil?
        #  user.shifts.create!(
        #    kind: 0,
        #    start: startTime,
        #    finish: finishTime)
        #end
      end
      
    end
  end
  
  
end

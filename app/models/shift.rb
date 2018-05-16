class Shift < ApplicationRecord
  belongs_to :user
  
  enum kind: [:dog_walking, :dog_cleaning, :cat_walking, :cat_cleaning]
  # TODO: expand shift types
  
  validates :user, presence: true
  validates :kind, presence: true
  validates :start, presence: true
  validates :finish, presence: true
  validate :start_before_finish
  
  
  # Checker to make sure that the start of the shift if before the finish.
  def start_before_finish
    errors.add(:start, "must be before finish") unless start < finish
  end
  
  require 'csv'
  
  # Method to import shift and user information from a CSV gained from Sign Up Genius
  def self.import(file)
    puts "***Importing***"
    CSV.foreach(file.path, headers: true) do |row|
      
      # Checks if the given row has information on who took the shift.
      # Certain rows on the CSV don't have names or emails.
      if row['First Name'] != NIL
        curr_name = row['First Name'] + " " + row['Last Name']
        users = User.where(name: curr_name)
        user = NIL;
        email = User.where(home_email: row['Email'])
        
        # If the user doesn't exist in the database based on the username
        # or the email on the CSV, then we create the user
        if users.empty? && email.empty?
          user = User.create!(name: curr_name, 
          home_email: email = row['Email'],
          password: 'password',
          home_phone: '(000) 000-0000')
        
        # If the user exists in the database, then we just use the first one.
        # Not meant to be the final implementation.
        elsif !users.empty? 
          user = users.first
        end
        
        # Store the time the shift started and the time it ended into variables
        startTime = row['Start Date/Time (mm/dd/yyyy)']
        finishTime = row['End Date/Time (mm/dd/yyyy)']
        
        #If we find a fitting user, then we create the shift based on the given row
        if !user.nil? && !startTime.blank? && !finishTime.blank? && !startTime.nil? && !finishTime.nil?
          user.shifts.create!(
            kind: 0,
            start: startTime,
            finish: finishTime)
        end
      end
      
    end
  end
  
  
end

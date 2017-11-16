class Interest < ApplicationRecord
    has_and_belongs_to_many :users
    
    def self.cat_interests 
        ["Feeding", "Playing", "Cleaning"]
    end
    
    def self.dog_interests
        ["Walking", "Feeding", "Playing", "Grooming", "Cleaning"]
    end

    def self.other_interests
        ["Cooking/baking", "Organizing events", "Fundraising", "Machine maintenance"]
    end
end

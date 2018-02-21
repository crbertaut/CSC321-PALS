class Interest < ApplicationRecord
    has_and_belongs_to_many :users
    validates :name, uniqueness: true
    
    def self.all_interests
        ["Dog shifts", "Dog fostering", "Dog transport", "Cat shifts", "Cat fostering", "Cat transport", "Cooking/baking", "Organizing events", "Fundraising", "Machine maintenance"]
    end
        
    def self.dog_interests
        ["Shifts", "Fostering", "Transport"]
    end

    def self.cat_interests 
        ["Shifts", "Fostering", "Transport"]
    end

    def self.other_interests
        ["Cooking/baking", "Organizing events", "Fundraising", "Machine maintenance"]
    end
end

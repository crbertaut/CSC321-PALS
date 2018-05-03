class Interest < ApplicationRecord
    has_and_belongs_to_many :people
    validates :name, uniqueness: true
    
    def self.all_interests
        ["Dog shifts", "Dog fostering", "Dog transport", "Dog grooming", "Dog training", 
        "Cat shifts", "Cat fostering", "Cat transport", 
        "Organizing events", "Fundraising (cooking/baking)", "Fundraising (telephone calls)", "Machine maintenance",
        "Telephone calls", "Volunteer coordination", 
        "Yard maintenance", "Clerical/office work", 
        "Adoption screening and follow-up", "Laundry", "Public relations",
        "Off-site adoption days", "Public education", "Pet visits to nursing homes"]
    end
        
    def self.dog_interests
        ["Shifts", "Fostering", "Transport", "Grooming", "Training"]
    end

    def self.cat_interests 
        ["Shifts", "Fostering", "Transport"]
    end

    def self.other_interests
        ["Organizing events", "Fundraising (cooking/baking)", "Fundraising (telephone calls)", 
        "Machine maintenance", "Yard maintenance", "Laundry",
        "Volunteer coordination", "Clerical/office work", 
        "Adoption screening and follow-up", "Public relations",
        "Off-site adoption days", "Public education", "Pet visits to nursing homes"]
    end
end

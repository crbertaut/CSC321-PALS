class Interest < ApplicationRecord
    has_and_belongs_to_many :users
    validates :name, uniqueness: true
    
    def self.all_interests
        ["Dog shifts", "Dog fostering", "Dog transport", "Dog grooming", "Dog training", 
        "Cat shifts", "Cat fostering", "Cat transport", 
        "Cooking/baking", "Organizing events", "Fundraising", "Machine maintenance",
        "Dog walking", "Cat cuddling", "Telephone calls", "Volunteer coordination", 
        "Yard maintenance", "Vet runs", "Baking for fundraisers", "Clerical/office work", "Housekeeping", 
        "Adoption screening and follow-up", "Laundry", "Grooming", "Public relations",
        "Off-site adoption days", "Public education", "Pet visits to nursing homes"]
    end
        
    def self.dog_interests
        ["Shifts", "Fostering", "Transport", "Grooming", "Training"]
    end

    def self.cat_interests 
        ["Shifts", "Fostering", "Transport"]
    end

    def self.other_interests
        ["Cooking/baking", "Organizing events", "Fundraising", "Machine maintenance",
        "Dog walking", "Cat cuddling", "Telephone calls", "Volunteer coordination", 
        "Yard maintenance", "Vet runs", "Baking for fundraisers", "Clerical/office work", "Housekeeping", 
        "Adoption screening and follow-up", "Laundry", "Grooming", "Public relations",
        "Off-site adoption days", "Public education", "Pet visits to nursing homes"]
    end
end

class UsersController < ApplicationController
    def donation_params
        params.require(:amount, :date, :user_id)
    end
    def create
        Donation.create!(donation_params)
    end
end
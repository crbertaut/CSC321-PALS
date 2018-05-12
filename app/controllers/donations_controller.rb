class UsersController < ApplicationController
    def donation_params
        params.require(:amount, :date, :user_id, :organization_id)
    end
    def create
        Donation.create!(donation_params)
        if (:user_id != 0) then
            (User.find_by id: donation_params[:user_id]).donated += donation_params[:amount]
        end
        if (:organization_id != 0) then
            (Organization.find_by id: donation_params[:organization_id].donated += donation_params[:amount])
        end
    end
end
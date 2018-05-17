class ShiftsController < ApplicationController

  def import
    Shift.import(params[:file])
    redirect_to root_url, notice: "Shifts data imported!"
  end
end

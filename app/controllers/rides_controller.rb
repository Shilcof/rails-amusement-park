class RidesController < ApplicationController

  before_action :redirect_if_not_logged_in

  def create
    flash[:notice] = Ride.new(ride_params).take_ride
    redirect_to current_user
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end

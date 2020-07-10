class Owner::ReservationsController < ApplicationController
  before_action :authenticate_owner!

  def index
    @reservation = Reservation.find_by(params[:id])
  end

end

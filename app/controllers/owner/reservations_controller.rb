class Owner::ReservationsController < ApplicationController
  def index
    @reservation = Reservation.find_by(params[:id])
  end
end

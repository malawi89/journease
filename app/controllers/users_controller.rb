class UsersController < ApplicationController
  def show_trips
    @trips = current_user.trips
    authorize @trips
  end
end

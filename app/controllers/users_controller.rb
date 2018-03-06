class UsersController < ApplicationController
  def show_trips
    @trips = current_user.trips
  end
end

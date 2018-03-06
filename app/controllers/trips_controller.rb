class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  # after_create :associate_user

    def new
      @trip = Trip.new
      @user = current_user
    end

    def create
      @trip = Trip.new(trip_params)
      @user = current_user
      if @trip.save
        @trip_user = TripUser.create!(trip: @trip, user: @user)
        redirect_to trip_path(@trip)
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @trip.update(trip_params)
        redirect_to trip_path(@trip)
      else
        render :edit
      end
    end

    def destroy
      @trip.destroy
      redirect_to items_path
    end

    private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, :photo)
    end
  end





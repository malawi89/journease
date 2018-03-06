class TripsController < ApplicationController
  before_action :set_trip, only: [:show,:update, :destroy]
  # after_create :associate_user

    def new
      @trip = Trip.new
      @user = current_user
      authorize @trip
    end

    def create
      @trip = Trip.new(trip_params)
      authorize @trip
      @user = current_user
      if @trip.save
        TripUser.create!(trip: @trip, user: @user)
        redirect_to trip_path(@trip)
      else
        render :new
      end
    end

    def edit
      @trip = Trip.find(params[:id])
      authorize @trip
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
      authorize @trip
    end

    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, :photo)
    end
  end





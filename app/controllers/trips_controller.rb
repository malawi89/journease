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

    def show
      accommodations = Accommodation.where.not(latitude: nil, longitude: nil)
      activities = Activity.where.not(latitude: nil, longitude: nil)
      journeys = Journey.where.not(latitude: nil, longitude: nil)

      @accommodations = []
      @trip.accommodations.each do |accommodation|
        @accommodations << accommodation if accommodations.include?(accommodation)
      end
      @activities = []
      @trip.activities.each do |activity|
        @activities << activity if activities.include?(activity)
      end
      @journeys = []
      @trip.journeys.each do |journey|
        @journeys << journey if journeys.include?(journey)
      end

      @markers = []
      @accommodations.each do |accommodation|
        icon = { url: ActionController::Base.helpers.asset_path(accommodation.sub_category.downcase+".png") }
        @markers << {
          lat: accommodation.latitude,
          lng: accommodation.longitude,
          icon: icon,
          infoWindow: { content: render_to_string(partial: "/accommodations/map_box", locals: { accommodation: accommodation }) }
        }
      end

      @activities.each do |activity|
        icon = { url: ActionController::Base.helpers.asset_path(activity.sub_category.downcase+".png") }
        @markers << {
          lat: activity.latitude,
          lng: activity.longitude,
          icon: icon,
          infoWindow: { content: render_to_string(partial: "/activities/map_box", locals: { activity: activity }) }
        }
      end

      @journeys.each do |journey|
        icon = { url: ActionController::Base.helpers.asset_path(journey.sub_category.downcase+".png") }
        @markers << {
          lat: journey.latitude,
          lng: journey.longitude,
          icon: icon,
          infoWindow: { content: render_to_string(partial: "/journeys/map_box", locals: { journey: journey }) },
          # id: journey.id
        }
      end
      authorize @trip
    end

    def all
      @trips = current_user.trips
      authorize @trips
    end

    def edit
      @trip = Trip.find(params[:id])
      authorize @trip
    end

    def update
      authorize @trip
      if @trip.update(trip_params)
        redirect_to trip_path(@trip)
      else
        render :edit
      end
    end

    def destroy
      authorize @trip
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





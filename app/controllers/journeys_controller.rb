class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]
  before_action :set_trip

  def new
    @journey = Journey.new
    @journey.trip = Trip.find(params[:trip_id])
    authorize @journey
  end

  def create
    @journey = Journey.new(journey_params)
    authorize @journey
    @journey.trip = @trip
    if @journey.save
      redirect_to trip_journey_path(@trip, @journey)
    else
      render :new
    end
  end

  def edit
    authorize @journey
  end

  def show
    authorize @journey
  end

  def update
    if @journey.update(journey_params)
      authorize @journey
      redirect_to trip_journey_path(@trip, @journey)
    else
      render :edit
    end
  end

  def destroy
    @journey.destroy
    authorize @journey
    redirect_to trip_path(@trip)
  end

  private

  def set_journey
    @journey = Journey.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def journey_params
    params.require(:journey).permit(:sub_category, :name, :travel_company, :travel_number, :seats,
      :departure_location, :start_time, :end_time, :arrival_location, :booking_references,
      :comments,:contact_details, :booking_documents, :photos)
  end
end

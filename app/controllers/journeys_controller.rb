class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]

  def new
    @journey = Journey.new
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.trip = @trip
    if @journey.save
      redirect_to trip_journey(@journey)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @journey.update(journey_params)
      redirect_to trip_journey(@journey)
    else
      render :edit
    end
  end

  def destroy
    @journey.destroy
    redirect_to trip_journey(@journey)
  end

  private

  def set_journey
    @journey = journey.find(params[:id])
  end

  def journey_params
    params.require(:journey).permit(:sub_category, :name, :travel_company, :travel_number, :seats,
      :departure_location, :departure_time, :arrival_time, :arrival_location, :booking_references,
      :comments,:contact_details, :booking_documents)
  end
end

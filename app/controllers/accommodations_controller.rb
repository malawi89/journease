class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]
  before_action :set_trip

  def new
    @accommodation = Accommodation.new
    authorize @accommodation
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    authorize @accommodation
    @accommodation.trip = @trip
    if @accommodation.save
      redirect_to trip_accommodation_path(@trip, @accommodation)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to trip_accommodation_path(@trip, @accommodation)
    else
      render :edit
    end
  end

  def destroy
    @accommodation.destroy
    redirect_to trip_path(@trip)
  end

  private

  def set_accommodation
    @accommodation = Accommodation.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def accommodation_params
    params.require(:accommodation).permit(:sub_category, :name, :location, :start_time, :end_time,
      :booking_references, :comments, :contact_details, :booking_documents, :photo)
  end
end

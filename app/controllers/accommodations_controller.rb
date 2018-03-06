class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]

  def new
    @trip = Trip.find(params[:trip_id])
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.trip = @trip
    if @accommodation.save
      redirect_to trip_accommodation(@accommodation)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to trip_accommodation(@accommodation)
    else
      render :edit
    end
  end

  def destroy
    @accommodation.destroy
    redirect_to trip_accommodation(@accommodation)
  end

  private

  def set_accommodation
    @accommodation = accommodation.find(params[:id])
  end

  def accommodation_params
    params.require(:accommodation).permit(:sub_category, :name, :location, :checkin, :checkout,
      :booking_references, :comments, :contact_details, :booking_documents, :photo)
  end
end

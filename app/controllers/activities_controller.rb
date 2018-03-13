class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_trip

  def new
    @activity = Activity.new
    @activity.trip = Trip.find(params[:trip_id])
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.trip = @trip
    if @activity.save
      redirect_to trip_activity_path(@trip, @activity)
      authorize @activity
    else
      render :new
    end
  end

  def edit
    authorize @activity
  end

  def show
    authorize @activity
  end

  def update
    if @activity.update(activity_params)
      authorize @activity
      redirect_to trip_activity_path(@trip, @activity)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    authorize @activity
    redirect_to trip_path(@trip)
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end


  def activity_params
    params.require(:activity).permit(:sub_category, :name, :location, :start_time,
      :end_time, :booking_references, :comments, :contact_details, :booking_documents, :photo)
  end
end

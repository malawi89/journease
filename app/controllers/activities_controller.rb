class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def new
    @trip = Trip.find(params[:trip_id])
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.trip = @trip
    if @activity.save
      redirect_to trip_activity(@activity)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to trip_activity(@activity)
    else
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to trip_activity(@activity)
  end

  private

  def set_activity
    @activity = activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:sub_category, :name, :location, :start_time,
      :end_time, :booking_references, :comments, :contact_details, :booking_documents, :photo)
  end
end

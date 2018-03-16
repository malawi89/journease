class TripUsersController < ApplicationController

  before_action :set_trip

  def add_friend

    @user = User.find_by(email: params[:add_friend][:email])
    if @user
      @trip_user = TripUser.new(trip: @trip, user: @user)
      authorize @trip_user
      if @trip_user.save
        # authorize @trip_user
        redirect_to my_trips_path(redirect_success: "friend")
      else
        skip_authorization
        render :action => "errormessage"
      end
    else
      skip_authorization
      render :action => "invitation"
      # if the email is not on the database
      # you could:
      # store the email in invited_emails
      # everytime a new user is created check if the user's email is in invited_emails
      # if it is, add the TripUser
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def added_user_params
    params.permit(:email)
  end

end

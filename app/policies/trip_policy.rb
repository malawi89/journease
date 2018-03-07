class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def update?
    # trip doesn't have user
    # to get user check connected tripuser and find the user that created the trip
    trip_user_id = TripUser.find_by(trip_id:record.id).user.id
    created_by = User.find(trip_user_id)
    # #check if the user the created the trip is the same as current_user and return true of false
    return created_by == user
  end

  def destroy?
    # to be modified like update
    record.user == user
  end

  def all?
    true
  end

end
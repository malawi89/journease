class AccommodationPolicy < ApplicationPolicy
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
    #to get user check connected tripuser and find the user that created the trip

    if TripUser.find_by(@trip).user.id.nil?
      false
    else
      true
    end
  end

  def destroy?
    if TripUser.find_by(@trip).user.id.nil?
      false
    else
      true
    end
  end

end

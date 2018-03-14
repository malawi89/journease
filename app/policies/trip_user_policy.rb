class TripUserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def add_friend?
    user.trips.include? record.trip
  end
end

class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record.trip.users.include?(user)
  end

  def create?
    record.trip.users.include?(user)
  end


  def update?
    record.trip.users.include?(user)
  end

  def destroy?
    record.trip.users.include?(user)
  end

end

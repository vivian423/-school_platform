class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    user.teacher?
  end

  def create?
    user.teacher?
  end

  def destroy?
    user.teacher?
  end
end

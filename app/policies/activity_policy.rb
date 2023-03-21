class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # user.teacher? ? scope.all : ""
      scope.all
    end
  end

  def show?

  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    user.teacher? == true
  end

  def destroy?
  end

end

class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    attr_reader :user

    def resolve
      # user.teacher? ? scope.all : ""
      if user.teacher
        scope.where(kid: user.kids)
      else
        scope.where(kid: user.children)
      end
    end
  end

  def show?
    true
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

class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.teacher
        scope.where(kid: user.kids)
      else
        scope.where(kid: user.children)
      end
    end
  end

  def show?
    user.children.ids.include?(record.kid.id)
  end

end

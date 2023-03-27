class MeetingsController < ApplicationController

  def index
    policy_scope(Meeting)
  end
end

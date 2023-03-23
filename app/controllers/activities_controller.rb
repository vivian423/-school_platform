class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = policy_scope(Activity)
    @naps = @activities.map(&:nap_duration)
    @bowels = @activities.map(&:bowel_movement)
    @moods = @activities.map(&:overall_mood)
    @food_consumption = @activities.map do |activity|
      activity.snack_consumption
      activity.lunch_consumption
    end
    # @values = {naps: @naps, bowels: @bowels, moods: @moods, food_consumption: @food_consumption}
  end

  def show
  end

  def new
    # @activity = Activity.new
    # authorize @activity
  end

  def create
    # @activity = Activity.new
    # @activity.user = @activity

    # authorize @activity
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

end

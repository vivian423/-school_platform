class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = policy_scope(Activity)
    @naps = @activities.map(&:nap_duration)
    @five_naps = @naps.last(5)
    @bowels = @activities.map(&:bowel_movement)
    @five_bowels = @bowels.last(5)
    @moods = @activities.map(&:overall_mood)
    @dates = @activities.map(&:date)
    @five_dates = @dates.last(5).map do |date|
      date.strftime("%a %d")
      # date.strftime("%Y-%m-%d")
    end

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

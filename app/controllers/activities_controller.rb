class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    @activities = policy_scope(Activity).order(created_at: :desc)
    @naps = @activities.map(&:nap_duration)
    @five_naps = @naps.first(5)
    @bowels = @activities.map(&:bowel_movement)
    @five_bowels = @bowels.first(5)
    @moods = @activities.map(&:overall_mood)
    @five_moods = @moods.first(5)
    @dates = @activities.map(&:date)
    @snack_consumption = @activities.map(&:snack_consumption)
    @lunch_consumption = @activities.map(&:lunch_consumption)
    @five_dates = @dates.first(5).map do |date|
      date.strftime("%a %d")
      # date.strftime("%Y-%m-%d")
    end
    @five_snack_consumption = @snack_consumption.last(5)
    @five_lunch_consumption = @lunch_consumption.last(5)

    # @five_snack_consumption = @
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

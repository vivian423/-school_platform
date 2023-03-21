class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]

  def index
    authorize @activity
  end

  def show

  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new
    @activity.user = @activity

    authorize @activity
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

end

class SportsController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  
  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])
    @activities = Activity
      .includes(activity_students: { student: :promo }, game: :sport)
      .joins(game: :sport)
      .where(sports: { name: @sport.name })
  end
end

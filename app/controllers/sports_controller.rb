class SportsController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  
  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])
  end
end

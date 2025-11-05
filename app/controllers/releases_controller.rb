class ReleasesController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @releases = Release.all.first(6)
    @most_viewed = Release.order(views: :desc).limit(1).take
  end

  def show
    @release = Release.find(params[:id])
    @release.increment!(:views)
  end
end

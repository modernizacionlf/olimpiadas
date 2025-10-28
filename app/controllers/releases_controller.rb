class ReleasesController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @releases = Release.all.first(6)
  end

  def show
    @release = Release.find(params[:id])
  end
end

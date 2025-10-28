class ReleasesController < ApplicationController
  def index
    @releases = Release.all.first(6)
  end

  def show
    @release = Release.find(params[:id])
  end
end

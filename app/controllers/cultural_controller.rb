class CulturalController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @culturals = Cultural.all
  end

  def show
    @cultural = Cultural.find(params[:id])
  end
end

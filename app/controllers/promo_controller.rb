class PromoController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @promos = Promo.all
  end

  def show
    @promo = Promo.find(params[:id])
  end
end

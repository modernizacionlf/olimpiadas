class PromoController < ApplicationController
  def index
    @promos = Promo.all
  end

  def show
    @promo = Promo.find(params[:id])
  end
end

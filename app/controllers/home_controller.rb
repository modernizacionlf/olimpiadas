class HomeController < ApplicationController
  allow_unauthenticated_access only: %i[index]

  def index
    @games = Game.all
  end
end

class GamesController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @games = Game.all
  end

  def show
  end
end

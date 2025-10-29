class GamesController < ApplicationController
  allow_unauthenticated_access only: %i[index show]

  def index
    @games = Games.all
  end

  def show
    @game = Game.find(params[:id])
  end
end

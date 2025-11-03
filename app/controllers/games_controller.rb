class GamesController < ApplicationController
  allow_unauthenticated_access only: %i[show]

  def show
  end
end

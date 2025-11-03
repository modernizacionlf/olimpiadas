class Game < ApplicationRecord
  belongs_to :sport
  belongs_to :instance, class_name: 'GameInstance', foreign_key: :game_instance_id
end

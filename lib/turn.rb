module MathGame
  class Turn

    def initialize(players)
      @players = players
      @current_player_index = 0
    end

    def rotate_players
      if (@current_player_index >= (@players.size-1))
        @current_player_index = 0
      else
        @current_player_index += 1
      end
    end

    def get_current_player
      @players[@current_player_index]
    end

    def get_current_player_index
      @current_player_index
    end

  end
end
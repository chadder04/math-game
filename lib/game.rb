require './lib/player'
require './lib/question'
require './lib/turn'

module MathGame
  class Game

    def initialize()
      @players = []
    end

    def start
      # Output a welcome message
      puts '---- WELCOME ----'

      # If @players array is empty, prompt user for number of players
      if (@players.empty?)
        create_players
      end

      # Initialize Turn class, passing in all @players
      turn = Turn.new(@players)
      
      # Play the game, while no user has lost all their lives
      while (!game_over?)
        question = Question.new
        print "#{turn.get_current_player.name}: #{question.get_question}"
        answer = gets.chomp

        # Confirm input from user is correct question answer
        if (question.check_answer(answer))
          puts '  Correct!'
          @players[turn.get_current_player_index].gain_point
        else
          puts '  Incorrect!'
          @players[turn.get_current_player_index].lose_life
        end

        # Rotate users turn
        turn.rotate_players
      end

      # If game is over, print game statistics
      if (game_over?)
        print_summary
      end
    end

    def create_players
      num_of_players = 0

      # Prompt user for amount of users playing
      print 'How many players are playing? '
      num_of_players = gets.chomp.to_i

      # Confirm there are at least 2 players
      if num_of_players < 2 
        puts '* Error: Must have more than 2 players to create game!'
        create_players
      end

      # Prompt each user for a name, and add to @players instance array
      (1..num_of_players).each do |i|
        print " What is Player #{i}'s Name: "
        add_player(Player.new(gets.chomp.to_s))
      end

      # Output a string to begin the game
      puts '---- LETS BEGIN ----'
    end

    # Game is over if any players have lost all their lives
    def game_over?
      @players.any?{ |player| !player.is_alive? }
    end

    # Add player to instance array @players
    def add_player(player)
      @players << player
    end

    # Print a summary of players scores/lives
    def print_summary
      puts '---- GAME OVER ----'
      @players.each do |player|
        puts " #{player.name} scored #{player.score} points with #{player.lives} lives remaining!"
      end
      puts '---- THANK YOU FOR PLAYING ----'
    end

  end
end
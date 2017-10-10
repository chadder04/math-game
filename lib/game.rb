require './lib/player'
require './lib/question'
require 'pry'

module MathGame
  class Game

    def initialize()
      @players = []
    end

    def start
      if (@players.empty?)
        create_players
      end
      
      while (!game_over?)
        question = Question.new
        print question.get_question
        answer = gets.chomp
        if (answer == 'END')
          break
        end
        if (question.check_answer(answer))
          puts 'Correct!'
        else
          puts 'Incorrect!'
        end
      end
    end

    def create_players
      num_of_players = 0
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
    end

    def game_over?
      @players.any?{ |player| !player.is_alive? }
    end

    def add_player(player)
      @players << player
    end

  end
end
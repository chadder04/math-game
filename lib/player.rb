module MathGame
  class Player
  attr_reader :name, :score, :lives

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def lose_life
    @lives -= 1
  end

  def gain_point
    @score += 1
  end

  def is_alive?
    @lives > 0
  end

  end
end
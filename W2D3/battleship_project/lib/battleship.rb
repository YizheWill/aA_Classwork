require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    p @board.num_ships
    @board.print
  end

  def lose?
    (p "you lose"; return true) if @remaining_misses <= 0
    false
  end

  def win?
    (p "you win"; return true) if @board.num_ships == 0
    false
  end

  def game_over?
    win? || lose?
  end

  def turn
    move = @player.get_move
    # if move == false
      # return @board.cheat
    # end
    if @board.attack(move) == false
      @remaining_misses -= 1
    end
    @board.print
    p @remaining_misses
  end
end

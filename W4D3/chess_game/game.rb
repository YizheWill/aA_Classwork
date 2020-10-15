require_relative "board"
require_relative "display"

class Game
  def initialize
    @board = Board.new
    @display = display.new
    @players = { player1: "X", player2: "O" }
    @current_player = @players[:player1]
  end

  def play
  end

  private

  def notify_players
  end

  def swap_turn
  end
end

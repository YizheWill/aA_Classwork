require "set"
require_relative "card"
require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
  attr_reader :board

  def initialize
    p "init"
    @board = Board.new
    @human_player = HumanPlayer.new
    @computer_player = ComputerPlayer.new
    @current_player = @human_player
    @seen_not_hit = Hash.new { |h, k| h[k] = Set.new([]) }
  end

  def switch_player
    @current_player = @current_player == @human_player ? @computer_player : @human_player
  end

  def reveal(pos)
    @board[pos].reveal
    @board.render
  end

  def play
    while !board.win?
      p "inplay"
      pos1 = @current_player.get_move(@board.valid_moves, @seen_not_hit, nil, @board)
      reveal(pos1)
      pos2 = @current_player.get_move(@board.valid_moves, @seen_not_hit, pos1, @board)
      reveal(pos2)
      if @board.match?(pos1, pos2)
        @current_player.hit += 1
        @board.delete_moves_from_valid(pos1, pos2)
      else
        sleep 2
        @board.fold(pos1, pos2)
        @board.render
        @seen_not_hit[@board[pos1].val] << pos1
        @seen_not_hit[@board[pos2].val] << pos2
      end
      switch_player
      p @seen_not_hit
    end
    if @computer_player.hit == @human_player
      p "draw game"
    elsif @computer_player.hit > @human_player
      p "alpha go wins"
    else
      p "terran's era"
    end
  end
end

game = Game.new
game.play

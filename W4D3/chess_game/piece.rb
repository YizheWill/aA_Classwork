require "singleton"
require_relative "slideable"
require_relative "stepable"

class Piece
  attr_reader :board, :color, :pos

  include Slideable
  include Stepable

  def initialize(color, board, pos)
    @color = color
    @board = board
    r, c = pos
    @board[r][c] = self
    @pos = pos
  end

  def to_s
    if self.color
      "#{self.symbol} #{self.color[0]}"
    else
      symbol
    end
  end

  def inspect
    if self.color
      "#{self.symbol} #{self.color[0]}"
    else
      symbol
    end
  end

  def empty?
  end

  def pos=(val)
  end

  def symbol
  end

  private

  def move_into_check?(end_pos)
  end
end

class NullPiece < Piece
  include Singleton
  attr_reader :symbol

  def initialize
    @symbol = "   "
  end
end

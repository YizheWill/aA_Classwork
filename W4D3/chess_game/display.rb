require_relative "cursor"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new
  end

  def render
  end
end

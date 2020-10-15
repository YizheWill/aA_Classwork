require_relative "piece"
require_relative "pieces"

class Board
  attr_reader :rows
  def self.generate_board
    board = Array.new(8) { Array.new(8) }
    #white side
    (0..7).each { |i| Pawn.new(:white, board, [1, i]) }
    Rook.new(:white, board, [0, 0])
    Rook.new(:white, board, [0, 7])
    Knight.new(:white, board, [0, 1])
    Knight.new(:white, board, [0, 6])
    Bishop.new(:white, board, [0, 2])
    Bishop.new(:white, board, [0, 5])
    Queen.new(:white, board, [0, 3])
    King.new(:white, board, [0, 4])
    #black side
    (0..7).each { |i| Pawn.new(:black, board, [6, i]) }
    Rook.new(:black, board, [7, 0])
    Rook.new(:black, board, [7, 7])
    Knight.new(:black, board, [7, 1])
    Knight.new(:black, board, [7, 6])
    Bishop.new(:black, board, [7, 2])
    Bishop.new(:black, board, [7, 5])
    Queen.new(:black, board, [7, 3])
    King.new(:black, board, [7, 4])
    (2..5).each do |i|
      (0..7).each do |j|
        board[i][j] = NullPiece.instance
      end
    end
    board
  end

  def initialize
    @rows = Board.generate_board
    @sentinel = NullPiece.instance
  end

  def move_piece(start_pos, end_pos)
    raise "no such a chess piece" if [start_pos] == NullPiece.instance
    res = self[start_pos].valid_moves(end_pos)
    raise "cannot go there" if !res
  end

  def [](pos)
    r, c = pos
    @rows[r][c]
  end

  def []=(pos, val)
    r, c = pos
    @rows[r][c] = val
  end
end

board = Board.new
board
board.move_piece([1, 0], [3, 0])
board.move_piece([0, 0], [2, 0])
# board.move_piece([2, 0], [2, 1])
board.move_piece([6, 0], [4, 0])
board.move_piece([7, 0], [5, 0])
board
# board.move_piece([1, 3], [3, 3])
# board.move_piece([0, 2], [2, 4])
# board.move_piece([2, 4], [0, 2])
# board.move_piece([3, 3], [4, 3])
# board.move_piece([2, 4], [3, 3])
# board.move_piece([3, 3], [2, 4])

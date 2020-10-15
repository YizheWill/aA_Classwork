require_relative "piece"

class King < Piece
  def symbol
    @symbol = :K
  end

  def valid_moves(end_pos)
    if king_stepable(@pos, end_pos, board)
      r, c = pos
      board[r][c] = NullPiece.instance
      r, c = end_pos
      board[r][c] = self
      @pos = end_pos
      return true
    end
    false
  end
end

class Queen < Piece
  def symbol
    @symbol = :Q
  end

  def valid_moves(end_pos)
    if slide_cross(@pos, end_pos, board) || slide_diagnal(@pos, end_pos, board)
      r, c = pos
      board[r][c] = NullPiece.instance
      r, c = end_pos
      board[r][c] = self
      @pos = end_pos
      return true
    end
    false
  end
end

class Bishop < Piece
  def symbol
    @symbol = :B
  end

  def valid_moves(end_pos)
    if slide_diagnal(@pos, end_pos, board)
      r, c = pos
      board[r][c] = NullPiece.instance
      r, c = end_pos
      board[r][c] = self
      @pos = end_pos
      return true
    end
    false
  end
end

class Knight < Piece
  def symbol
    @symbol = :T
  end

  def valid_moves(end_pos)
    if knight_stepable(@pos, end_pos, board)
      r, c = pos
      board[r][c] = NullPiece.instance
      r, c = end_pos
      board[r][c] = self
      @pos = end_pos
      return true
    end
    false
  end
end

class Rook < Piece
  def symbol
    @symbol = :R
  end

  def valid_moves(end_pos)
    if slide_cross(@pos, end_pos, @board)
      r, c = pos
      board[r][c] = NullPiece.instance
      r, c = end_pos
      board[r][c] = self
      @pos = end_pos
      return true
    end
    false
  end
end

class Pawn < Piece
  attr_accessor :first_step

  def initialize(*for_super)
    a, b, c = for_super
    super(a, b, c)
    @first_step = true
  end

  def symbol
    @symbol = :P
  end

  def valid_moves(end_pos)
    if pawn_stepable(@pos, end_pos, board)
      r, c = pos
      board[r][c] = NullPiece.instance
      r, c = end_pos
      board[r][c] = self
      @pos = end_pos
      return true
    end
    false
  end
end

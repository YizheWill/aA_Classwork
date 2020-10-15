require_relative "slideable"

module Stepable
  include Slideable

  def knight_stepable(start_pos, end_pos, board)
    r, c = start_pos
    er, ec = end_pos
    possible = []
    possible << [r - 2, c - 1] << [r - 2, c + 1] << [r - 1, c - 2] << [r - 1, c + 2] << [r + 1, c - 2] << [r + 1, c + 2] << [r + 2, c - 1] << [r - 2, c + 1]
    possible = possible.select { |e| e.all? { |el| el.between?(0, 7) } }
    if possible.include?(end_pos) && board[er][ec].color != board[r][c].color
      r, c = pos
      board[r][c] = NullPiece.instance
      r, c = end_pos
      board[r][c] = self
      @pos = end_pos
      return true
    end
    return false
  end

  def king_stepable(start_pos, end_pos, board)
    r, c = start_pos
    er, rc = end_pos
    return false if board[r][c].color == board[er][ec].color
    return false if r == er && c == rc
    if (r - er).abs <= 1 && (c - rc).abs <= 1
      r, c = pos
      board[r][c] = NullPiece.instance
      r, c = end_pos
      board[r][c] = self
      @pos = end_pos
      return true
    end
    return false
  end

  def pawn_stepable(start_pos, end_pos, board)
    r, c = start_pos
    er, ec = end_pos

    if board[r][c].first_step
      (return false) if c != ec || (er - r).abs > 2
      #setting the first step to be false here
      if board[r][c].color == :black
        if er < r
          board[r][c].first_step = false
          return true
        end
        return false
      else
        if er > r
          board[r][c].first_step = false
          return true
        end
        return false
      end
    else
      return false if c != ec || (er - r).abs != 1
      if board[r][c].color == :black
        if er < r
          board[r][c].first_step = false
          return true
        end
        return false
      else
        if er > r
          board[r][c].first_step = false
          return true
        end
        return false
      end
    end
  end
end

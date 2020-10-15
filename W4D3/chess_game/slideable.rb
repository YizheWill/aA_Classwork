module Slideable
  def slide_cross(start_pos, end_pos, board)
    r, c = start_pos
    er, ec = end_pos
    if board[r][c].color == board[er][ec].color
      return false
    elsif ec == c && er == r
      return false
    elsif ec != c && er != r
      return false
    elsif ec < c
      move_left(r, c, er, ec, board)
    elsif ec > c
      move_right(r, c, er, ec, board)
    elsif er < r
      move_up(r, c, er, ec, board)
    elsif er > r
      move_down(r, c, er, ec, board)
    end
  end

  def move_left(r, c, er, ec, board)
    ec += 1
    while ec < c
      return false if board[r][ec] != NullPiece.instance
      ec += 1
    end
    return true
  end

  def move_right(r, c, er, ec, board)
    c += 1
    # p r, c, er, ec
    while c < ec
      return false if board[r][c] != NullPiece.instance
      c += 1
    end
    return true
  end

  def move_up(r, c, er, ec, board)
    er += 1
    while er < r
      return false if board[er][c] != NullPiece.instance
      er += 1
    end
    return true
  end

  def move_down(r, c, er, ec, board)
    r += 1
    while r < er
      return false if board[r][c] != NullPiece.instance
      r += 1
    end
    return true
  end

  def slide_diagnal(start_pos, end_pos, board)
    r, c = start_pos
    er, ec = end_pos
    return false if (r - er).abs != (c - ec).abs
    return false if board[r][c].color == board[er][ec].color
    return false if r == er || c == ec
    if r < er
      test_down(r, c, er, ec, board)
    else
      test_up(r, c, er, ec, board)
    end
  end

  def test_down(r, c, er, ec, board)
    if c < ec
      test_right_down(r, c, er, ec, board)
    else
      test_left_down(r, c, er, ec, board)
    end
  end

  def test_up(r, c, er, ec, board)
    if c < ec
      test_right_up(r, c, er, ec, board)
    else
      test_left_up(r, c, er, ec, board)
    end
  end

  def test_left_up(r, c, er, ec, board)
    p 1
    r -= 1
    c -= 1
    while r != er && c != ec
      return false if board[r][c] != NullPiece.instance
      r -= 1
      c -= 1
    end
    true
  end

  def test_left_down(r, c, er, ec, board)
    p 2
    r += 1
    c -= 1
    while r != er && c != ec
      return false if board[r][c] != NullPiece.instance
      r += 1
      c -= 1
    end
    true
  end

  def test_right_up(r, c, er, ec, board)
    p 3
    r -= 1
    c += 1
    while r != er && c != ec
      return false if board[r][c] != NullPiece.instance
      r -= 1
      c += 1
    end
    return true
  end

  def test_right_down(r, c, er, ec, board)
    p 4

    r += 1
    c += 1
    while r != er && c != ec
      return false if board[r][c] != NullPiece.instance
      r += 1
      c += 1
    end
    true
  end
end

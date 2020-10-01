class Board

  def initialize(num)
    @board = Array.new(num) {Array.new(num, "_")} 
  end

  def valid?(pos)
    pos.all?{|e| e < @board.length && e >= 0}
  end

  def [](pos)
    @board[pos.first][pos.last]
  end

  def []=(pos, val)
    @board[pos.first][pos.last] = val
  end

  def empty?(pos)
    self[pos] == "_"
  end

  def place_mark(pos, mark)
    return false if !valid?(pos) || !empty?(pos)
    self[pos] = mark
  end

  def print_board
    @board.flatten.each_with_index do |char, idx|
      if idx != 0 && idx % @board.length == 0
        print "\n#{char} "
      else
        print "#{char} "
      end
    end
    print "\n"
  end

  def win_row?(mark)
    @board.any? { |sub| sub.uniq.length == 1 && sub.uniq.first == mark }
  end

  def win_col?(mark)
    @board.transpose.any? { |sub| sub.uniq.length == 1 && sub.uniq.first == mark }
  end

  def win_diagonal?(mark)
    d = (0...@board.length).all? do |i|
      @board[i][i] == mark
    end

    u = (0...@board.length).all? do |i|
      @board[@board.length - i - 1][i] == mark
    end

    d || u
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @board.any? do |sub|
      sub.any? {|el| el == "_"}
    end
  end

  def legal_positions
    positions = []
    @board.each_with_index do |sub, i|
      sub.each_with_index do |el, j|
        positions << [i, j] if @board[i][j] == "_"
      end
    end
    positions
  end
end


# board  = Board.new(3)
# board.place_mark([0,0], :Z)
# board.place_mark([0,1], :K)
# board.place_mark([0,2], :Y)

# p board.legal_positions
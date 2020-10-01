class Board

  def initialize
    @board = Array.new(3) {Array.new(3, "_")} 
  end

  def valid?(pos)
    pos.all?{|e| e < 3 && e >= 0}
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
    raise "invalid postion" if !valid?(pos) || !empty?(pos)
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
end

# board = Board.new
# board.print_board
# # board.place_mark([1,0],:X)
# # board.place_mark([0,1],:X)
# # board.place_mark([0,2],:X)
# # board.print_board
# # p "col #{board.win_col?(:X)}"
# # p "row #{board.win_row?(:X)}"
# # p "diag #{board.win_diagonal?(:X)}"
# # p "win #{board.win?(:X)}"
# # p "empty? #{board.empty_positions?}"
# # board.place_mark([0,0],:O)
# # # # board.place_mark([1,1],:O)
# # # board.place_mark([2,2],:O)
# # board.print_board
# # p "col #{board.win_col?(:O)}"
# # p "row #{board.win_row?(:O)}"
# # p "diag #{board.win_diagonal?(:O)}"
# # p "win #{board.win?(:X)}"
# # p "empty? #{board.empty_positions?}"
# board.place_mark([2,0],:O)
# board.place_mark([1,1],:O)
# board.place_mark([0,2],:O)
# board.print_board
# p "col #{board.win_col?(:O)}"
# p "row #{board.win_row?(:O)}"
# p "diag #{board.win_diagonal?(:O)}"
# p "win #{board.win?(:O)}"
# p "empty? #{board.empty_positions?}"


require_relative "card.rb"
class Board
    attr_reader :size, :board
    def initialize(size)
        raise "Error" if !size.even?
        @size = size
        @board = Array.new(size){Array.new(size)}
        @valid_moves = []
        (0...size).each do |i|
          (0...size).each do |j|
            @valid_moves << [i, j]
          end
        end
        populate
    end

    def valid_moves
      @valid_moves
    end

    def update_valid_move(pos)
      @valid_moves.delete(pos)
    end

    def populate
        face_values = ("A".."Z").to_a
        candidates = (face_values.sample((size * size)/2) * 2).shuffle
        (0...size).each do |i|
            (0...size).each do |j|
                @board[i][j] = Card.new(candidates.pop)
            end
        end
    end

    def render
      print "  "
      (0...@board.length).each {|i| print "#{i} "}
      print "\n"
      @board.each_with_index do |row, index|
        print "#{index} "
        row.each do |card|
          print "#{card.to_s} "
        end
        puts
      end
    end

    def cheat
      print "  "
      (0...@board.length).each {|i| print "#{i} "}
      print "\n"
      @board.each_with_index do |row, index|
        print "#{index} "
        row.each do |card|
          print "#{card.face_value} "
        end
        puts
      end 
    end

    def won?
      @board.all? {|row| row.all?{|card| card.face_up?}}
    end

    def reveal(guess_pos)
      row, col = guess_pos
      @board[row][col].flip
    end


    def [](pos)
      row,col = pos
      return @board[row][col]
    end
end

# board = Board.new(4)
# board.populate
# p board.board
require_relative "card"

class Board
  attr_reader :size, :valid_moves

  def check_digit_and_even(string)
    if string.match(/^\d*$/) && string.to_i.even?
      return string.to_i
    else
      return false
    end
  end

  def initialize
    (p "give me a size"; @size = check_digit_and_even(gets.chomp)) while !@size
    deck = Card.random_a_deck(size * size / 2)
    p deck
    @board = Array.new(size)
    size.times { |i| @board[i] = (deck[(i * size)...(i + 1) * size].map { |c| Card.new(c) }) }
    @valid_moves = []
    size.times { |i| size.times { |j| @valid_moves << [i, j] } }
  end

  def inspect
    @board
  end

  def [](pos)
    p pos
    row, col = pos
    @board[row][col]
  end

  def match?(pos1, pos2)
    self[pos1] == self[pos2]
  end

  def delete_moves_from_valid(pos1, pos2)
    @valid_moves -= [pos1, pos2]
  end

  def fold(pos1, pos2)
    self[pos1].fold
    self[pos2].fold
  end

  def render
    print "  "
    size.times { |i| print "#{i} " }
    puts
    @board.each_with_index do |ele, idx|
      print "#{idx} "
      ele.each do |card|
        print "#{card.to_s} "
      end
      puts
    end
  end

  def cheat
    print "  "
    size.times { |i| print "#{i} " }
    puts
    @board.each_with_index do |ele, idx|
      print "#{idx} "
      ele.each do |card|
        print "#{card.val} "
      end
      puts
    end
  end

  def win?
    @board.all? { |sub| sub.all?(&:face_up) }
  end
end

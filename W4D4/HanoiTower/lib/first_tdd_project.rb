class Array
  def my_uniq
    result = Hash.new(0)
    self.each do |ele|
      result[ele] += 1
    end
    result.keys
  end

  def two_sum
    result = []
    self.each_with_index do |ele1, i1|
      self.each_with_index do |ele2, i2|
        if ele1 + ele2 == 0 && i2 > i1
          result << [i1, i2]
        end
      end
    end
    result
  end
end

def my_transpose(array)
  return array.transpose
end

def stock_picker(array)
  max = array[1] - array[0]
  result = [0, 1]
  (0...array.length).each do |i|
    (i + 1...array.length).each do |j|
      if array[j] - array[i] > max
        max = array[j] - array[i]
        result = [i, j]
      end
    end
  end
  result
end

class TowersofHanoi
  attr_reader :board

  def initialize(n)
    @size = n
    @board = Array.new(3) { Array.new }
    @board[0] = (1..n).to_a
  end

  def move(current_pos, new_pos)
    if !board[current_pos].empty? && (board[new_pos].empty? || board[current_pos].first <= board[new_pos].first)
      board[new_pos].unshift(board[current_pos].shift)
      return true
    end
    false
  end

  def won?
    board.last.length == @size
  end

  def play
    while !won?
      puts "please give me two indices, from and to. ex: '0 1'"
      p board
      x, y = gets.chomp.split.map(&:to_i)
      while !move(x, y)
        puts "invalid"
        x, y = gets.chomp.split.map(&:to_i)
      end
    end
    puts "you win the game!"
  end
end

b = TowersofHanoi.new(3)
b.play

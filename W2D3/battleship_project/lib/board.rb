class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |sub|
      sub.each_with_index do |char, i|
        if i != grid.length - 1
          print "#{char} "
        else
          print "#{char}\n"
        end
      end
    end
    print '\n'
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](array)
    x = array[0]
    y = array[1]
    @grid[x][y]
  end

  def []=(array, value)
    x, y = array
    @grid[x][y] = value
  end

  def num_ships
    @grid.sum { |sub| sub.count(:S) }
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      p "you sunk my battleship"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    to_random = size / 4
    result = []
    while result.length < to_random
      x = rand(0...@grid.length)
      y = rand(0...@grid.length)
      if !result.include?([x, y])
        @grid[x][y] = :S
        result << [x, y]
      end
    end
  end

  def hidden_ships_grid
    new_grid = @grid.map do |subarray|
      subarray.map { |ele| ele == :S ? ele = :N : ele }
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end

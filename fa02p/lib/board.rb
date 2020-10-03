class Board
  attr_reader :max_height

  def print
    @stacks.each { |stack| p stack }
  end

  def self.build_stacks(n_stacks_to_build)
    Array.new(n_stacks_to_build) { Array.new }
  end

  def initialize(n_stacks_to_build, max_height)
    @max_height = max_height
    @stacks = Board.build_stacks(n_stacks_to_build)
    raise "rows and cols must be >= 4" if n_stacks_to_build < 4 || max_height < 4
  end

  def add(token, which_stack_to_add_the_token)
    if @stacks[which_stack_to_add_the_token].length < @max_height
      @stacks[which_stack_to_add_the_token].unshift(token)
      return true
    else
      return false
    end
  end

  def vertical_winner?(token)
    @stacks.any? { |stack| stack.first == token && stack.length == max_height && stack.uniq.length == 1 }
  end

  def horizontal_winner?(token)
    (0...max_height).any? do |i|
      (0...@stacks.length).all? do |j|
        @stacks[j][i] == token
        #@stacks[0][0] == @stacks[1][0] == @stacks[2][0] .... @stacks[n][0] == token
      end
    end
  end

  def winner?(token)
    vertical_winner?(token) || horizontal_winner?(token)
  end
end

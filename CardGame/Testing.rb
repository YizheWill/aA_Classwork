# @param {Character[][]} grid
# @return {Integer}
class Node
  attr_reader :x, :y

  def initialize(value, x, y)
    @value = value
    @x = x
    @y = y
    @next_steps = []
  end

  def add_node(node)
    @next_steps << node
  end
end

def grid_to_node(grid)
  nodes = []
  grid.each_with_index do |array, x|
    array.each_with_index do |val, y|
      node = Node.new(grid[x][y])
      if x + 1 < 
    end
  end
end

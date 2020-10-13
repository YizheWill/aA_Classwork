require_relative "./00_tree_node.rb"

class KnightPathFinder
  attr_reader :root_node
  def self.valid_moves(pos)
    r, c = pos
    positions = []
    positions << [r - 1, c - 2] << [r - 1, c + 2] << [r + 1, c - 2] << [r + 1, c + 2] << [r - 2, c - 1] << [r - 2, c + 1] << [r + 2, c - 1] << [r + 2, c + 1]

    # p "before alter #{positions}"
    positions = positions.select { |position| position.all? { |e| e.between?(0, 7) } }
    # p "after alter #{positions}"
    # sleep 1
    return positions
  end

  attr_reader :start_pos

  def initialize(position) #([0,0])
    # p "erherer"
    # @board = Array.new(8) { Array.new(8) }
    @start_pos = position
    @considered_positions = []
    # @result = []
    build_move_tree
    p @considered_positions.length

    # p @considered_positions.length
    # p @considered_positions.uniq.length
  end

  # def [](pos)
  #   r, c = pos
  #   @board[r][c]
  # end

  # def []=(pos, val)
  #   r, c = pos
  #   @board[r][c] = val
  # end

  def build_move_tree # Node[0,0]
    @root_node = PolyTreeNode.new(@start_pos)
    tree = [@root_node] #after first round tree = []
    while !tree.empty?
      #after line 39 => tree => [N(v(2,1)), N(v(1,2))]
      res = tree.shift #tree = [] # res => TreeNode with the value of [2,1]
      positions = new_move_positions(res.value) # positions => [[0,2],[1,3], [3,3], [4,2], [5,0]]
      #tree => [N(v(1,2))]
      positions.each do |n| # n=> [2,1]
        nd = PolyTreeNode.new(n) # nd=> Node with with the value of [2,1]
        res.add_child(nd)
        tree << nd
      end # tree => [N(v(1,2)),N [0,2],[1,3], [3,3], [4,2], [5,0]]
    end
  end

  attr_accessor :root_node

  # def build_move_tree
  #   p "asdfasdfasdlfj"
  #   sleep 1
  #   self.root_node = PolyTreeNode.new(start_pos)

  #   # build the tree out in breadth-first fashion
  #   nodes = [root_node]
  #   until nodes.empty?
  #     current_node = nodes.shift

  #     current_pos = current_node.value
  #     new_move_positions(current_pos).each do |next_pos|
  #       next_node = PolyTreeNode.new(next_pos)
  #       current_node.add_child(next_node)
  #       nodes << next_node
  #     end
  #   end
  # end

  def new_move_positions(pos)
    candidates = KnightPathFinder.valid_moves(pos)
    candidates = candidates.select { |e| !@considered_positions.include?(e) }
    @considered_positions.concat(candidates)
    return candidates
    #@considered_positions = (@considered_positions.concat(candidates)).uniq
  end

  def find_path(end_position)
    end_node = @root_node.bfs(end_position)
    path = trace_path_back(end_node)
    return path
  end

  def trace_path_back(node)
    array = []
    while !node.parent.nil?
      array << node.value
      node = node.parent
    end
    array << node.value
    return array.reverse
  end
end

# p KnightPathFinder.valid_moves([3, 3])

kpf = KnightPathFinder.new([0, 0])
# kpf.build_move_tree
#  p kpf.root_node

p kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
p kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

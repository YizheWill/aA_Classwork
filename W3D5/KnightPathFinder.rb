require_relative "tree"
require "byebug"
# class Tree

class KnightPathFinder
    attr_reader :root_node

    def self.build_new_tree(root_node, considered_positions)
        que=[root_node]
        until que.length == 0
            # debugger
            cur=que.pop
            next_steps = KnightPathFinder.valid_moves(cur.pos)
            next_steps.each do |pos|
                next if considered_positions.include?(pos)
                child = Tree.new(pos)
                que.unshift(child)
                cur.add_child(child)
                considered_positions << pos
            end
        end
    end

    def initialize(start)
       @start = start
       @board = Array.new(8) {Array.new(8, nil)} 
       @considered_positions = [start]
       @root_node = Tree.new(start)
       KnightPathFinder.build_new_tree(@root_node, @considered_positions) # comment out when testing build and search
    end

    def self.valid_moves(start)
        r, c = start
        res = []
        m_arr=[-2,-1,1,2]
        m_arr.each do |x|
            m_arr.each do |y|
                res << [r+x,c+y] if x.abs != y.abs
            end
        end
        res.reject! do |el|
            el.any?{|num| num<0 || num>7}
        end
        res
    end

    def new_move_positions(pos)
        val_moves=KnightPathFinder.valid_moves(pos)
        val_moves.each do |move|
            @considered_positions << move if !@considered_positions.include?(move)
        end
        #not returning for now
    end

    def build_parent_array(node)
        res = [node.pos]
        a = node.dup
        c = node.dup
        while node.parent
            res.unshift(c.parent.pos)
            c = c.parent
        end
        node = a
        res
    end

    def find_path(target)
        # @root_node = Tree.new(@start)
        # @considered_positions = [@start]
        # KnightPathFinder.build_new_tree(@root_node, @considered_positions)
        que = [@root_node]

        until que.length == 0
            # debugger
            cur=que.pop
            cur.children.each do |child|
                if child.pos ==  target
                    p "was here, the pos is #{child.pos}, the target is #{target}}"
                    res = build_parent_array(child) 
                    return res
                end
                que.unshift(child)
                cur.add_child(child)
            end
        end
    end

    # def build_and_search(target)
    #     que=[@root_node]
    #     until que.length == 0
    #         cur=que.pop
    #         return build_parent_array(cur) if cur.pos == target
    #         next_steps = KnightPathFinder.valid_moves(cur.pos)
    #         next_steps.each do |pos|
    #             next if @considered_positions.include?(pos)
    #             child = Tree.new(pos)
    #             que.unshift(child)
    #             cur.add_child(child)
    #             @considered_positions << pos
    #         end
    #     end
    # end

end

kpf = KnightPathFinder.new([0, 0])
# p kpf.build_and_search([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
# new = KnightPathFinder.new([0,0])
# new.build_new_tree()
# Root = new.root_node
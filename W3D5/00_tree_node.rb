require "byebug"

class Searchable 

    def dfs(target) 
        return nil if !self || !target 
        return self if self.value == target
        self.children.each do |node|
            result = node.dfs(target)
            return result if !result.nil?
        end
        nil 
    end

    def bfs(target)
        # return self if self.value == target 
        queue = [self]
        until queue.empty?
            current_node = queue.shift
            return current_node if current_node.value == target
            queue += current_node.children
        end
        nil
    end
end

class PolyTreeNode < Searchable 
 
    attr_reader :children, :value, :parent 

    def initialize(value)
        @value = value 
        @children = [] 
        @parent = nil 
    end

    def parent=(new_parent_node)
        @parent && @parent.children.delete(self)
        @parent = new_parent_node
        new_parent_node && new_parent_node.children << self 
        # if !new_parent_node
        #     if @parent
        #         @parent.children.delete(self) 
        #         @parent = nil 
        #     end
        # else 
        #     if new_parent_node != @parent 
        #         new_parent_node.children << self
        #         @parent && @parent.children.delete(self) 
        #         @parent = new_parent_node
        #     end
        # end
        
    end

    def add_child(child)
        # @parent.children << child
        # self.parent = child
        child.parent = self

        # self.children << child
    end

    def remove_child(child)
        if !children.include?(child)
            raise "error"
        else
            child.parent = nil
        end
    end
end



# node1 = PolyTreeNode.new("root")
# node2 = PolyTreeNode.new("child1")
# node3 = PolyTreeNode.new("child2")

# node2.parent = node1
# node3.parent = node1
# node3.parent = node1
# p node1.children
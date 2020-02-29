class Tree
    attr_reader :parent, :children
    attr_accessor :pos
    def initialize(value)
        @pos = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        parent.children.delete(self) if parent
        @parent = new_parent
        new_parent.children << self if parent && !parent.children.include?(self)
        new_parent
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent=nil
        raise "no child node found" if !children.include?(child_node)
        @children.delete(child_node)
    end

    def dfs(target_value)
        return nil if self.nil?
        return self if self.value == target_value
        children.each do |child|
            result = child.dfs(target_value)
            return result if result
        end
        nil
    end
    
    def bfs(target_value)
        return nil if self.nil?
        que=[self]
        until que.length == 0
            cur=que.pop
            return cur if cur.value==target_value
            cur.children.each do |child|
                que.unshift(child)
            end
        end
        return nil
    end

    
end


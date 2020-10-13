require_relative "tic_tac_toe"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :children, :prev_move_pos

  MARKS = [:x, :o]

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    # maybe not needed
    @prev_move_pos = prev_move_pos
  end

  def children
    @children = []
    next_mark = next_mover_mark == :x ? :o : :x
    (0..2).each do |i|
      (0..2).each do |j|
        if @board[[i, j]].nil?
          current_board = @board.dup
          current_board[[i, j]] = next_mark
          @children << TicTacToeNode.new(current_board, next_mark, [i, j])
        end
      end
    end
    return nil if @children.empty?
    return @children
  end

  def losing_node?(evaluator)
    if @board.over?
      return board.won? && board.winner != evaluator
    else
      if evaluator == next_mover_mark
        #could be right
        return self.children.all? { |node| node.losing_node?(evaluator) }
      else
        return self.children.any? { |node| node.losing_node?(evaluator) }
        # if self.children.all? { |node| node.losing_node?(evaluator) }
        #   return false
        # else
        #   return true
        # end
      end
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.

end

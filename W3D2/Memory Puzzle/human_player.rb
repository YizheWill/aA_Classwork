class HumanPlayer
  attr_accessor :hit

  def initialize
    @hit = 0
  end

  def valid_position?(valid_moves, string, previous_pos)
    if string.match(/^\d* \d*$/) && valid_moves.include?(string.split.map(&:to_i)) && string.split.map(&:to_i) != previous_pos
      return string.split.map(&:to_i)
    else
      return false
    end
  end

  def get_move(valid_moves, seen_not_hit, previous_pos, board)
    (p "please make a valid move :  example: 1 2"; pos = valid_position?(valid_moves, gets.chomp, previous_pos)) until pos
    return pos
  end
end

class ComputerPlayer
  attr_accessor :hit

  def initialize
    @hit = 0
  end

  def valid_position?(pos, previous_pos)
    p pos
    if pos != previous_pos
      return pos
    else
      return false
    end
  end

  def get_move(valid_moves, seen_not_hit, previous_pos, board)
    p "randoming a pair of location"
    sleep 2
    pos = nil
    if !previous_pos
      seen_not_hit.each do |k, v|
        if v.length >= 2
          p k, v
          pos = v.first
          v.delete(pos)
          p "other place"
          return pos
        end
      end
    end
    p "previous is #{previous_pos}"
    if previous_pos && seen_not_hit.has_key?(board[previous_pos].val) && seen_not_hit[board[previous_pos].val].length > 0
      p "there"
      pos = seen_not_hit[board[previous_pos].val].first
      seen_not_hit[board[previous_pos].val].delete(pos)
      return pos
    else
      pos = valid_position?(valid_moves.sample, previous_pos)
      while !pos
        pos = valid_position?(valid_moves.sample, previous_pos)
      end
      return pos
    end
  end
end

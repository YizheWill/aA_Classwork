class ComputerPlayer
  attr_reader :mark_value

  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    chosen_position = legal_positions.sample
    p "computer #{@mark_value} chose position #{chosen_position}"
    return chosen_position
  end
end
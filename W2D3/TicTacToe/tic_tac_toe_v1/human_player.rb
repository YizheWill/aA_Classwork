class HumanPlayer

  attr_reader :mark_value

  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position
    p "Please enter a position, such as: 0 1"
    p "your mark is #{@mark_value}"
    input = gets.chomp
    digits = ("0".."9").to_a
    raise "too many spaces" if input.count(" ") > 1 
    raise "too many digits" if input.split.length != 2
    raise "numbers only" if !input.split.all? {|el| digits.include?(el)}
    input.split.map(&:to_i)
  end

end

# josh = HumanPlayer.new(:J)
# josh.get_position
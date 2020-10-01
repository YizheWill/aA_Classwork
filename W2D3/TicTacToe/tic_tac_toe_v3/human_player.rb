class HumanPlayer

  attr_reader :mark_value

  def initialize(mark_value)
    @mark_value = mark_value
  end

  def get_position(legal_positions)
    p "Please enter a position, such as: 0 1"
    p "your mark is #{@mark_value}"
    
    digits = ("0".."9").to_a
    begin
      input = gets.chomp
      (p "too many spaces"; raise "error")  if input.count(" ") > 1 
      (p "too many digits"; raise "error") if input.split.length != 2
      (p "numbers only"; raise "error") if !input.split.all? {|el| el.chars.all? {|c| digits.include?(c)}}
      (p "invalid"; raise "error") if !legal_positions.include?(input.split.map(&:to_i))
    rescue
      p "invalid input, try again"
      input = gets.chomp
    end
    input.split.map(&:to_i)
  end

end

# josh = HumanPlayer.new(:J)
# josh.get_position
class Player
  def get_move
    p "enter a position with coordinates separated with a space like `4 7`"
    # if could be "cheat"
    input = gets.chomp
    # if input == "cheat"
    # return false
    # end
    return input.split.map(&:to_i)
  end
end

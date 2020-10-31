class Card
  attr_reader :rank, :suit, :c_j, :b_j

  def initialize(suit, rank, c_j = false, b_j = false, front_color = "white", back_color = "black")
    if suit == ""
      @c_j = c_j
      @b_j = b_j
    else
      @suit = suit
      @rank = rank
    end
    @destroyed = false
  end

  def destroy_a_card()
    @destroyed = true
  end
end

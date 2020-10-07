class Card
  attr_reader :face_value 
  def initialize(face_value)
    @face_up = false
    @face_value = face_value
  end

  def hide
    @face_up = false
  end

  def face_up?
    @face_up
  end

#   def reveal
#     @face_up = true 
#     @face_value
#   end

  def to_s
    return @face_value if @face_up
    " "
  end

  def flip
    @face_up = !@face_up
  end

  def ==(other_card)
    self.face_value == other_card.face_value
  end
end

# card = Card.new("Joker")

# card.hide
# p card.face_value
# p card.face_up?
# card.reveal
# p card.face_up?

# another_card = Card.new("Jack")
# p card == another_card
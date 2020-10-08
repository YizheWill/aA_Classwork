class Card
  attr_reader :val, :face_up

  VALUES = ("A".."Z").to_a

  def self.random_a_deck(num_of_pairs)
    deck = []
    if num_of_pairs <= 26
      return (VALUES.sample(num_of_pairs) * 2).shuffle
    else
      num_of_pairs.times { deck << Card.new(VALUES.sample) }
      (deck * 2).shuffle
    end
  end

  def inspect
    @val
  end

  def initialize(val)
    @val = val
    @face_up = false
  end

  def fold
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(card1)
    val == card1.val
  end

  def to_s
    if @face_up
      return val
    else
      return " "
    end
  end
end

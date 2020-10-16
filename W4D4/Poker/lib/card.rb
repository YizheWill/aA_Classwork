class Card
  attr_reader :suit, :rank

  def self.deck_generator
    deck = []
    %i(HEART DIAMOND SPADE CLUB).each do |suit|
        (1..13).each do |rank|
            deck.push(Card.new(suit, rank))
        end
    end
    deck
  end

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end
end

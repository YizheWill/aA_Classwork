require_relative "Card.rb"

class Deck
  attr_reader :deck

  def initialize(deck_type)
    @deck_type = deck_type
    @deck = []

    if @deck_type == 54
      p "54"
      %w(HEART DIAMOND SPADE CLUB).each do |suit|
        (1..13).each do |rank|
          @deck << Card.new(suit = suit, rank = rank)
        end
      end
      @deck << Card.new(suit = "", rank = 15, c_j = true)
      @deck << Card.new(suit = "", rank = 14, c_j = false, b_j = true)
    elsif (@deck_type == 13)
      p "13"
      (1..13).each do |rank|
        @deck << Card.new(suit = "HEART", rank = rank)
      end
    else
      p "52"
      %w(HEART DIAMOND SPADE CLUB).each do |suit|
        (1..13).each do |rank|
          @deck << Card.new(suit = suit, rank = rank)
        end
      end
    end
    @deck.shuffle!
  end

  def empty?
    @deck.empty?
  end

  def pop
    @deck.pop
  end
end

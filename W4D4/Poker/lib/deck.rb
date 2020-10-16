require_relative "card"
class Deck
    attr_reader :cards
    def initialize
        @cards = Card.deck_generator
    end
end
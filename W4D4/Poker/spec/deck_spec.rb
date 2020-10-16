require "deck"
describe Deck do
  let (:deck) { Deck.new }
  describe "#initialize" do
    it "should have 52 cards" do
      expect(deck.cards.length).to eq(52)
      expect(deck.cards.all? { |card| card.is_a?(Card) }).to eq(true)
    end
  end
end


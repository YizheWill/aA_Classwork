require "card"
describe Card do
  let (:card) { Card.new(:HEART, 8) }
  describe "#initialize" do
    it "should accept a suit and a rank as arguments" do
      card
    end
    it "should set @suit to be the given suit, and @rank to be the given rank" do
      expect(card.suit).to eq(:HEART)
      expect(card.rank).to eq(8)
    end
  end
end

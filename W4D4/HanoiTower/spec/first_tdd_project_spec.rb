require "first_tdd_project"
describe "#my_uniq" do
  # maybe need to create a variable
  it "should remove dups" do
    expect([1, 2, 1, 3, 3].my_uniq).to eq [1, 2, 3]
  end
end

describe "#two_sum" do
  it "should return indices of the pair that sum to zero" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq [[0, 4], [2, 3]]
  end
end

describe "#my_transpose" do
  it "should transpose a 2D array" do
    rows = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
    ]
    # expect(rows).not_to receive(:transpose)
    expect(my_transpose(rows)).to eq [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
  end
  it "should not raise error if 2D array passed in"
end

describe "#stock_picker" do
  it "should return the most profitable pair" do
    base = [1, 2, 3, 4, 5, 6]
    expect(stock_picker(base)).to eq [0, 5]
  end
end

describe TowersofHanoi do
  let (:tower) { TowersofHanoi.new(3) }
  describe "#initialize" do
    it "should accept a number as an argument" do
      tower
    end
    it "should set board to be 3 arrays" do
      expect(tower.board.length).to eq(3)
      expect(tower.board.all? { |ele| ele.is_a?(Array) }).to eq(true)
    end
    it "should store n disks in the first array" do
      expect(tower.board.first).to eq([1, 2, 3])
    end
  end

  describe "#move" do
    # allow move
    context "should return a boolean" do
      it "should make change to the board and return true" do
        expect(tower.move(0, 1)).to eq(true)
        expect(tower.board).to eq([[2, 3], [1], []])
      end
      it "should return false" do
        expect(tower.move(2, 0)).to eq(false)
      end
    end
  end

  describe "#won?" do 
    context "should return a boolean" do 
      it "should return true" do 
        tower.move(0, 2)
        tower.move(0, 1)
        tower.move(2, 1)
        tower.move(0, 2)
        tower.move(1, 0)
        tower.move(1, 2)
        tower.move(0, 2)
        expect(tower.board.last).to eq([1, 2, 3])
        expect(tower.won?).to eq(true)
      end
      it "should return false" do 
        tower.move(0, 1)
        tower.move(0, 2)
        expect(tower.won?).to eq(false)
      end
    end
  end
end

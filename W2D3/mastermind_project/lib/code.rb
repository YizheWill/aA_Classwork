class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
  }

  def self.valid_pegs?(arr)
    arr.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  def self.random(number)
    arr = []
    number.times { arr << POSSIBLE_PEGS.keys.sample }
    Code.new(arr)
  end

  def self.from_string(string)
    Code.new(string.chars)
  end

  def initialize(arr)
    raise "invalid input" if !Code.valid_pegs?(arr)
    @pegs = arr.map(&:upcase)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    guess.pegs.each_with_index.inject(0) do |acc, (char, index)|
      if @pegs[index] == char
        acc += 1
      else
        acc
      end
    end
  end

  def num_near_matches(guess)
    guess.pegs.each_with_index.inject(0) do |acc, (char, index)|
      if @pegs[index] != guess.pegs[index] && @pegs.include?(char)
        acc += 1
      else
        acc
      end
    end
  end

  def ==(code)
    @pegs == code.pegs
  end
end

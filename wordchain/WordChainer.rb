class WordChainer
  attr_accessor :dict, :dictionary, :word_pool

  def initialize(file)
    @dict = file
  end

  def readfile
    file = File.open(@dict)
    @dictionary = []
    while !file.eof
      @dictionary << file.readline
    end
    file.close
  end

  def chooseSameLengthWord(word)
    len = word.length
    @word_pool = @dictionary.select { |e| e.length == len }
    p @word_pool
  end

  def find_one_letter_diff(word)
    one_diff = chooseSameLengthWord(word).select {|w| is_candidate(w, src)}
    return one_diff
  end

  def to_find(src, target)
    @seen << src
    @candidate << src
    @pool << find_one_letter_diff(src).select {|e| !@seen.include?(e)}
    while(!@pool.empty?)
    if (pool.include?(target))
      @candidate.each {|w| p w}
      p target
      return true
    else
      to_find(@pool.shift, target)
    end
    return false

  end


  def is_candidate_atx(src, tgt, index)
    i = 0
    while i < src.length
      if index == i && src[i] == tgt[i]
        return false
      end
      if index != i && src[i] != tgt[i]
        return false
      end
      i += 1
    end
    return true
  end

  def is_candidate(src, tgt)
    index = 0
    while index < src.length
      if is_candidate_atx(src, tgt, index) == false
        index += 1
      else
        return true
      end
    end
    return false
  end
end

if __FILE__ == $0
  wc = WordChainer.new(ARGV[0])
  wc.readfile
  p wc.dictionary
  p wc.is_candidate("suck", "sack")
end


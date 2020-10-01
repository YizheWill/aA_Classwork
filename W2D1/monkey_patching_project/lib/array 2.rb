# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / (self.length * 1.0)
  end
  
  def median
    return nil if self.empty?
    sorted = self.sort
    if sorted.length.even? 
      (sorted[sorted.length / 2 ] + sorted[sorted.length/2 - 1] )/ 2.0
    else
      sorted[sorted.length/2]
    end
  end

  def counts
    # hash = Hash.new(0)
    # self.each{|ele|hash[ele]+=1}
    # return hash
    self.inject(Hash.new(0)){|a,e|a[e] += 1;a}
  end

  def my_count(char)
    self.inject(Hash.new(0)){|a,e|a[e] += 1;a}[char]
  end

  def my_index(char)
    self.each_with_index do |c,i|
      c == char ? (return i ): c
    end
    nil
  end

  def my_uniq
    self.inject(Hash.new(0)){|a,e|a[e] += 1;a}.keys
  end

  def my_transpose
    result = Array.new(self.length){Array.new}
    self.each_with_index do |array,row|
      array.each_with_index do |char,col|
        result[row][col] = self[col][row]
      end
    end
    result
  end
end


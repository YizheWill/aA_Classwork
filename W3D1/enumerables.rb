class Array
  def my_each(&blk)
    self.length.times do |i|
      yield(self[i])
    end
    self
  end

  def my_select(&blk)
    result = []
    self.my_each { |ele| result << ele if blk.call(ele) }
    result
  end

  def my_reject(&blk)
    result = []
    self.my_each { |ele| result << ele if !blk.call(ele) }
    result
  end

  def my_any?(&blk)
    self.my_each {|ele| return true if yield(ele)}
    return false
  end

  def my_all?(&blk)
    self.my_each {|ele| return false if !yield(ele)}
    return true
  end

  def my_flatten
    result = []
    return self if self.empty?
    self.my_each do |ele|
        if !ele.is_a?(Array)
            result << ele 
        else 
            result += ele.my_flatten
        end
    end
    result
  end

  def my_zip(*arrays)
    result = [self]
    arrays.my_each do |array|
        if array.length > self.length
            array = array[0...self.length]
        elsif array.length < self.length
            array[self.length - 1] = nil 
        end
        result << array 
    end
    result.transpose
  end

  def my_rotate(index=1)
    dup = self.dup
    actual = index % self.length 
    # actual > 0 ? actual.times {dup<<dup.shift} : -actual.times {dup.unshift(dup.pop)}
    # dup
    if actual_index > 0
      actual_index.times do 
        first = dup.shift
        dup.push(first)
      end
    else
      actual_index.times do 
        last = dup.pop
        dup.unshift(last)
      end
    end
    dup
  end

  def my_join(str = "")
    self.inject("") {|acc,ele| acc += ele + str}
  end

  def my_reverse
    result = []
    self.my_each do |ele|
      result.unshift(ele)
    end
    result
  end
end
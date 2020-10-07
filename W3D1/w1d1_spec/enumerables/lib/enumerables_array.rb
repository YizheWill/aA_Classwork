def factors(num)
  (1..num).select {|n| num % n == 0}
end

def subwords(str, dict)
  res = []
  dict.each do |el|
    if str.include?(el)
      res << el
    end
  end
  res
end

def doubler(arr)
    arr.map {|ele| ele * 2}
end

class Array
  def bubble_sort!(&blk)
    blk ||= Proc.new {|a, b| a<=>b}
    sorted = false
    while !sorted
      sorted = true 
      (0...self.length - 1).each do |i|
        # if self[i] > self[i + 1]
        if blk.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          sorted = false
        end
      end
    end
    return self
  end

  def bubble_sort
    dup = self.dup 
    dup.bubble_sort!
  end

  def my_each(&blk)
    self.length.times do |i|
      yield(self[i])
    end
    self
  end 

  def my_map(&blk)
    result = []
    self.each do |ele|
      result << blk.call(ele)
    end
    result
  end

  def my_select(&blk)
    result = []
    self.my_each { |ele| result << ele if blk.call(ele) }
    result
  end


  def my_inject(default = nil,&blk)
      self.each_with_index do |ele,idx|
          if idx == 0 && !default
              default = ele  
          else  
              default = blk.call(default,ele)
          end
      end
      default
  end
  
  
end
def concatenate(arr)
  arr.inject {|acc, ele| acc += ele}
end


#PROBLEM 1
  
  def my_map(array, &prc)
    res = []
    array.each do |el|
      res << prc.call(el)
    end
    res
  end


#PROBLEM 2

def my_select(array, &prc)
    res = []
    array.each do |el|
        prc.call(el)? res.push(el) : el
    end
    return res
end

#PROBLEM 3
def my_count(array, &prc)
  count=0
  array.each do |ele|
    prc.call(ele) ? count += 1 : ele
  end
  return count
end

#PROBLEM 4

def my_any?(array, &prc)
    my_count(array, &prc) > 0 
end

#PROBLEM 5

def my_all?(array, &prc)
  my_count(array, &prc) == array.length
end

#PROBLEM 5
def my_none?(array, &prc)
  my_count(array, &prc) == 0   
end


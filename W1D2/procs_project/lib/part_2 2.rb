

#PROBLEM 1

  def reverser(string, &prc)
    prc.call(string.reverse)
  end

#PROBLEM 2

def word_changer(string, &prc)
    string.split(' ').map(&prc).join(" ")
end


def greater_proc_value(num, prc1, prc2)
  [prc1.call(num), prc2.call(num)].max
end

def and_selector(array, prc1, prc2)
  array.select {|ele| prc1.call(ele) && prc2.call(ele)}
end

def alternating_mapper(array, prc1, prc2)
  array.map.with_index {|ele, ind| ind.even? ? prc1.call(ele) : prc2.call(ele)}
end
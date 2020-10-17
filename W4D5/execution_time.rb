def my_min_phase_1(list)
  list.each do |num1|
    return num1 if list.all? {|num2| num1 <= num2}  
  end
end
#O(n**2)

def my_min_phase_2(list)
  champ = list[0]
  list.each do |num|
    champ = num if num < champ
  end
  champ
end
#O(n)

def largest_contiguous_sub_sum(list)
  sub_arrays = []
  (0...list.length-1).each do |idx1|
    (idx1...list.length).each do |idx2|
      sub_arrays << list[idx1..idx2]
    end
  end
  champ = sub_arrays[0].sum
  sub_arrays.each do |sub_array|
    champ = sub_array.sum if sub_array.sum > champ
  end
  champ
end

#O(n**2)

def largest_contiguous_sub_sum(list)
    current_largest = list[0]
    previous_largest = list[0]
    i = 1
    while i < list.length
        if list[i] + current_largest < 0
            i += 1
            current_largest = 0
            next
        end
        current_largest += list[i]
        previous_largest = current_largest if current_largest > previous_largest
        i += 1
    end
    previous_largest
end


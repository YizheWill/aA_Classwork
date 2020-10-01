

#PROBLEM 1

  def select_even_nums(array)
    array.select(&:even?)
  end

#PROBLEM 2

def reject_puppies(array)
    array.reject { |dog| dog["age"] <= 2 }
end

#PROBLEM 3

def count_positive_subarrays(arrays)
  arrays.count {|array| array.sum > 0}

end

#PROBLEM 4

def aba_translate(string)
    result = []

    string.each_char do |char|
        if 'aeiou'.include?(char)
            result << (char + 'b' + char)
        else
           result << char
        end 
    end
    result.join('')
end

#PROBLEM 5

def aba_array(array)
  array.map do |word|
    aba_translate(word)
  end
end

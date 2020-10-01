
#problem 1

def average(num1, num2)
  (num1 + num2) / 2.0
end


#problem 2

def average_array(arr)
    arr.sum / (arr.length * 1.0)
end

#problem 3

def repeat(string, num)
  new_string = ""
  num.times {new_string += string}
  new_string
end

#problem 4

def yell(string)
    string.upcase + '!'
end

#problem 5

def alternating_case(string)
  new_array = []
  words = string.split(" ")
  words.each_with_index do |word, i|
   if i % 2 == 0 
    new_array << word.upcase
   else
    new_array << word.downcase
   end
  end
  new_array.join(" ")
end
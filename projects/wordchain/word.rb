def convert(s, num_rows)
  hash = Hash.new { |h, k| h[k] = [] }
  i = 0
  s.each_char.with_index do |char, index|
    if ((index + 1) % (2 + (num_rows - 1)) < num_rows)
      p "first char is #{char}, index is #{index},index / num is #{index / num_rows},  index % num_rows is #{index % num_rows}"
      hash[(index / num_rows) * (num_rows - 1)] << char
    else
      p "second char is #{char}, index is #{index},index / num is #{index / num_rows},  index % num_rows is #{index % num_rows}"
      hash[(index / num_rows) * (num_rows - 1) + index % (num_rows)] << char
    end
  end
  p hash
end

convert("stringsss", 3)

# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

def peak_finder(arr)
    return arr if arr.length <= 1
    result = []

    (0..arr.length - 1).each do |i|
        if i == 0 && arr[0] > arr[i + 1]
            result.push(arr[0])
        elsif i == arr.length - 1 && arr[-2] < arr[-1]
            result.push(arr[-1])
        elsif i > 0 && i < arr.length - 1
            result.push(arr[i]) if arr[i] > arr[i - 1] && arr[i] > arr[i + 1]
        end 
    end
    result
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]

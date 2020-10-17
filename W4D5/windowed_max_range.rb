require 'byebug'
def naive_solution(array,w)
    return nil if w > array.length
    result = find_min_max(array[0...w])
    # debugger
    (1..array.length-w).each do |i|
        candidate = find_min_max(array[i...i+w])
        result = candidate if candidate > result
    end
    result    
end

def find_min_max(array)
    return array.max-array.min
end
#keep track the max and min
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# max = array[0]
# min = array[0]
# queue = []
# if queue.length == window_size

# end
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

class MyQueue
  #peek, size, empty?, enqueue, and dequeue methods 
  def initialize
    @store = []
  end
  def enqueue(ele)
    @store << ele
  end
  def enqueue(ele)
    @store.shift(ele)
  end
  def peek
    @store.first
  end
end
class MyStack
  #peek, size, empty?, pop and push
  def initialize
    @store = []
  end
  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end

  def pop
    if !empty?
       @store.pop
    else
      return false
    end
  end

  def push(ele)
    @store << ele
  end
end
nlogn
logn
[2,4,7,1,19,23,44,8,9], 5
1st window => [2,4,7,1,19]
sorted => [1,2,4,7,19] => res => 18
reverse_sorted => [19,7,4,2,1]
store sorted in a stack
store 1st window in a queue
next round
deque 2 enqueue 23 => log(n)
search 2 in both stacks delete it
enque 23 put at the right position(log(n)) return top - bottom => compare with prev
sorted => [1,4,7,19,23]
rev => [23, 19, 7, 4, 1]
check min max diff(0(1))





class StackQueue
  1 step in first window we sort everything
  store it in a stack


  [1,2,3,4,5,6,7] , 4
   stack1 => [1,2,3,4]
   stack2 => [1,2,3,4]
   dequeue val => 1
   push to stack => 5
   interm = 4
   queue => [1,2,3,4]

   push to stack [1,2,3,4,5]
   dequeue the queue [2,3,4]

end

# p naive_solution([1,2,3,5,17],3)

# max = array[0]
# min = array[0]
# queu = []
    # queu.length = 3
    


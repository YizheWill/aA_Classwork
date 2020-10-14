# # def sqrt(num)
# #   unless num >= 0
# #     raise ArgumentError.new "Cannot take sqrt of negative number"
# #   end

# #   # code to calculate square root...
# # end

# # def main
# #   # run the main program in a loop
# #   while true
# #     # get an integer from the user
# #     puts "Please input a number"
# #     num = gets.to_i
# #     begin
# #       s = sqrt(num)
# #     rescue ArgumentError => e
# #       puts "Couldn't take the square root of #{num}"
# #       puts "Error was: #{e.message}"
# #     end
# #   end
# #   p s
# # end

# require "singleton"

# class A
#   include Singleton
#   COLOR = :red
# end

# a = A.instance
# b = A.instance
# p a == b

# class B
#   def initialize(name)
#     @name = name
#   end
# end

# class C < B
#   attr_reader :name

#   # def initialize(name, age)
#   #   @age = age
#   #   super(name)
#   # end
# end

# module X
#   def hello
#     p "hello world #{world}"
#   end

#   def world
#     raise "doesnt have such method"
#   end
# end

# class Y
#   include X

#   def hello
#     p "hey"
#   end

#   def world
#     p "world"
#   end
# end

# class Z < Y
# end

# z = Z.new
# z.world

class A
  def initialize(name:, age:)
    @name = name
    @age = age
  end

  def inspect
    "#{self.class}'s instance"
  end

  def to_s
    self.class
  end
end

class B < A
  def initialize(name, age)
    super(name: name, age: age)
  end

  def say_name
  end

  private

  attr_reader :name
end

b = B.new("a", 2)
p b

# a = A.new(name: "Will", age: 1)
# p a

# class B
#   def initialize(a, b)
#     @a = a
#     @b = b
#   end
# end

# class C < B
#   def initialize(a,b,*c)
#     super
#   end
# end

class A
end

class B < A
end

class C < B
end

class D < A
end

class E < D
end

class F < E
en

class NewClass
end

class F < NewClass
end

# class A
#   def check_func
#     return 0 if !@a || !@b
#     return @a + @b
#   end

#   def create_var(a, b)
#     @a, @b = a, b
#   end
# end

# a = A.new
# b = A.new
# p a.check_func
# a.create_var(3, 5)
# b.create_var(4, 5)
# p a == b # return false
# Object Class may have the == operator, just checking the obj_id

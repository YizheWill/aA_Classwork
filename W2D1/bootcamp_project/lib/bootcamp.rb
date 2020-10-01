class Bootcamp
  attr_reader :name, :slogan, :teachers, :students  
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new{|h,k|h[k]=[]}
  end

  def hire(str)
    @teachers.push(str)
  end

  def enroll(stu)
    (@students << stu; return true) if @students.length < @student_capacity
    false
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    begin
      @students.length / @teachers.length
    rescue  
      p "no teacher hired yet"
    end
  end

  def add_grade(student,grade)
    if enrolled?(student)
        @grades[student] << grade
        return true
    end
    false  
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    return nil if @grades[student].empty?
    @grades[student].sum/num_grades(student)
  end

end

# bt = Bootcamp.new("aA", "wewefaqdf", 1)
# p bt.enroll("Rex")
# # p bt.enroll("Will")
#  bt.student_to_teacher_ratio
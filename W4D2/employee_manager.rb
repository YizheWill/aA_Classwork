class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    if self.class == Manager
      multiplier * check_sub_salary
    else
      return @salary * multiplier
    end
  end

  def check_sub_salary
    sum = 0
    self.subordinates.each do |e|
      if e.is_a?(Manager)
        sum += e.salary
        sum += e.check_sub_salary
      else
        sum += e.salary
      end
    end
    sum
  end
end

class Manager < Employee
  attr_accessor :subordinates

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @subordinates = []
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
ned.subordinates = [darren]
darren.subordinates = [shawna, david]
p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)

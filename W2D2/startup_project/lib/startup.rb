require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.include?(title)
  end

  def >(another_start_up)
    self.funding > another_start_up.funding 
  end

  def hire(employee_name, title)
    if @salaries.include?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "error"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee_instance)
    if @funding >= @salaries[employee_instance.title]
        employee_instance.pay(@salaries[employee_instance.title])
      @funding -= @salaries[employee_instance.title]
    else
      raise "No enough funding"
    end
  end

  def payday
    @employees.each do |employee_instance|
        pay_employee(employee_instance)
    end
  end

  def average_salary
    @employees.sum { |e| @salaries[e.title] } / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(another_start_up)
    @funding += another_start_up.funding
    another_start_up.salaries.each do |k, v|
      if !@salaries.include?(k)
        @salaries[k] = v
      end
    end
    @employees += another_start_up.employees
    another_start_up.close
  end
end

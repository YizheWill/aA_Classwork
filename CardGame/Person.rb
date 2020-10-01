require_relative "Bank_Account.rb"

class Person
  attr_reader :bank

  def initialize(name = "John Doe")
    # p "as a casino, we need to know your real name"
    @name = name
    @bank = Bank_Account.new()
  end
end

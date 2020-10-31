class Bank_Account
  attr_reader :cash_available, :money_in_bank

  def initialize(alert = 150, user_name = "username", password = "password", money_in_bank = 100)
    @cash_available = rand(100..102)
    @money_in_bank = money_in_bank
    @alert = alert
    @user_name = user_name
    @password = password
    # p "Your bank name"
    # @bank_name = gets.chomp
    # p "please choose your bank username, remember it somewhere, or you will lose all your money"
    # @user_name = gets.chomp
    # p "please choose your bank password, remember it somewhere, or you will lose all your money"
    # @password = gets.chomp
    # p "please set an alert if the money is less than certain amount, must be more than 100"
    # @alert_value = gets.chomp.to_i
    # p "How much money do you want to deposit when openning the account?"
    # @amount = gets.chomp.to_i
  end

  def deposit(num)
    @money_in_bank += num
  end

  def draw()
    if @money_in_bank >= 100
      p "you have #{@money_in_bank} dollars in bank, how much do you want to draw? type quit if you want to cancel"
      money_to_draw = gets.chomp
      if money_to_draw == "quit"
        return false
      else
        while money_to_draw.to_i > @money_in_bank
          p "you don't have that much, you have #{@money_in_bank} dollars"
          money_to_draw = gets.chomp
          if money_to_draw == "quit"
            return false
          end
        end
        @money_in_bank -= money_to_draw.to_i
        return money_to_draw.to_i
      end
    else
      p "You are broke, you only have #{@money_in_bank} dollars, and that's not enough, byebye"
      return false
    end
  end

  def check_auth(username, password)
    return @user_name == username && @password == password
  end

  def alert()
    return if @alert < @money_in_bank
    (p "current balance is lower than the alert that you set up"; return) if @money_in_bank <= @alert
  end
end

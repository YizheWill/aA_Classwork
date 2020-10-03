class Item
  attr_accessor :title, :deadline, :description
  attr_reader :done
  def self.valid_date?(date_string)
    # regex = /((19|20)\\d\\d)-(0?[1-9]|1[012])-([12][0-9]|3[01]|0?[1-9])/
    # date_string.match(regex)
    style = ("0".."9").to_a + ["-"]
    date_string.each_char { |char| return false if !style.include?(char) }
    #no more chars
    datesplit = date_string.split("-")
    year = datesplit.first
    month = datesplit[1]
    day = datesplit.last
    return false if year.length != 4 || month.length != 2 || day.length != 2
    return false if !(year.to_i <= 2020 && year.to_i > 1900)
    return false if !(month.to_i >= 1 && month.to_i <= 12)
    return false if !(day.to_i >= 1 && day.to_i <= 31)
    true
  end

  def initialize(title, deadline, description)
    raise "Invalid Date" if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
    @done = false
  end

  def toggle
    @done = !@done
  end
end

#rufo

require_relative "item.rb"

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = "")
    return false if !Item.valid_date?(deadline)
    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    return false if index < 0
    return false if index >= size
    true
  end

  def swap(index_1, index_2)
    index_1 = index_1.to_i
    index_2 = index_2.to_i
    return false if !valid_index?(index_1)
    return false if !valid_index?(index_2)
    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
  end

  # def [](index)
  #   return nil if !valid_index?(index)
  #   @items[index]
  # end

  def priority #most important item
    @items.first
  end

  def print
    puts "------------------------------------------"
    puts "                #{label}"
    puts "------------------------------------------"
    puts "Index | Item               | Deadline"
    puts "------------------------------------------"
    (0...size).each do |i|
      puts "#{i}     | #{@items[i].title} | #{@items[i].deadline} | #{@items[i].done}"
    end
    puts "------------------------------------------"
  end

  def print_full_item(index)
    index = index.to_i
    puts "------------------------------------------"
    puts "#{@items[index].title}      #{@items[index].deadline}"
    puts "#{@items[index].description}"
    puts "------------------------------------------"
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount = 1)
    index = index.to_i
    return false if !valid_index?(index)
    amount.times do
      (p "At the top of the list, can't go up anymore"; return true) if index == 0
      swap(index, index - 1)
      index -= 1
    end
    return true
  end

  def down(index, amount = 1)
    index = index.to_i
    return false if !valid_index?(index)
    amount.times do
      (p "At bottom of list, can't go up anymore"; return true) if index == size
      swap(index, index + 1)
      index += 1
    end
    return true
  end

  def sort_by_date!
    @items.sort_by!(&:deadline)
  end

  def toggle_item(idx)
    @items[idx].toggle
  end

  def remove_item(idx)
    idx = idx.to_i
    return false if !valid_index?(idx)
    @items.delete_at(idx)
    return true
  end

  def purge
    @items = @items.reject(&:done)
  end
end

require_relative "p03_hash_set"
require_relative "p04_linked_list"

class HashMap < HashSet
  attr_accessor :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
    # self[key].include?(key)
  end

  def set(key, val)
    if @count == num_buckets
      resize!
    end
    bucket = get_bucket(key)
    bucket.include?(key) ? bucket.update(key, val) : (bucket.append(key, val); @count += 1)
  end

  def get(key)
    get_bucket(key).get(key)
  end

  def delete(key)
    bucket = get_bucket(key)
    bucket.include?(key) ? (get_bucket(key).remove(key); @count -= 1) : nil
  end

  def each(&prc)
    @store.each do |linked_list|
      linked_list.each { |el| yield(el.key, el.val) }
    end
  end

  # # uncomment when you have Enumerable included
  # # def to_s
  # #   pairs = inject([]) do |strs, (k, v)|
  # #     strs << "#{k.to_s} => #{v.to_s}"
  # #   end
  # #   "{\n" + pairs.join(",\n") + "\n}"
  # # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def get_bucket(key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp, @store = @store, Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0
    temp.each do |linkedlist|
      linkedlist.each { |el| set(el.key, el.val) }
    end
    @store
  end

  # def bucket(key)
  #   # optional but useful; return the bucket corresponding to `key`
  # end
end

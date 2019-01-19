require "byebug"

class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false) 
  end

  def insert(num)
    raise "Out of bounds" unless (0...@store.length).include?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

 
class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_idx = num % @store.length 
    @store[bucket_idx] << num unless self.include?(num)
  end

  def remove(num)
    if self.include?(num)
      bucket_idx = num % @store.length 
      @store[bucket_idx].delete(num)
    end 
  end

  def include?(num)
    bucket_idx = num % @store.length 
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      bucket_idx = num % num_buckets
      @store[bucket_idx].push(num)
      @count += 1

      resize! if count > num_buckets

    end
  end

  def remove(num)
    if include?(num)
      bucket_idx = num % num_buckets
      @store[bucket_idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket_idx = num % num_buckets
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    curr_nums = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    until curr_nums.empty?
      self.insert(curr_nums.shift )
    end
  end
end

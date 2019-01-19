class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(key)
    hash = key.hash
    unless include?(key)
      bucket_idx = hash % num_buckets
      @store[bucket_idx].push(key)
      @count += 1

      resize! if count > num_buckets

    end
  end

  def include?(key)
    hash = key.hash
    bucket_idx = hash % @store.length 
    @store[bucket_idx].include?(key)
  end

  def remove(key)
    hash = key.hash
    if include?(key)
      bucket_idx = hash % num_buckets
      @store[bucket_idx].delete(key)
      @count -= 1
    end
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


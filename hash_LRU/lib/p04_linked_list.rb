class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
 
  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new 

    @head.next = @tail 
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next.object_id == @tail.object_id
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    unless include?(key)
      node = Node.new(key, val)
      @tail.prev.next = node
      node.prev = @tail.prev
      @tail.prev = node
      node.next = @tail
    end 
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    result = []
    i = @head.next
    p i
    until result.size == 2
      result << i.val
      i = i.next
    end
    result
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

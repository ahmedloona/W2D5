class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    string = self.to_s.each_byte.to_a.join("")
    num = string.to_i
    num.hash
  end
end

class String
  def hash
    string = self.to_s.each_byte.to_a.join("")
    num = string.to_i
    num.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    string = self.to_a.sort.to_s.each_byte.to_a.join("")
    num = string.to_i
    num.hash
  end
end

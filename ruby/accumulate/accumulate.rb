# Basic tools solution

class Array
  def accumulate (&block)
    proc = Proc.new &block
    array = []
    i = 0
    until i == self.length
      array << proc.call(self[i])
      i = i + 1
    end
    array
  end
end

# puts %w(hello world).accumulate(&:upcase)

# usual Ruby enumerator solution
# class Array
#   def accumulate (&block)
#     proc = Proc.new &block
#     self.map &proc
#   end
# end

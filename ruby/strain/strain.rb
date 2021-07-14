class Array
  def keep &block
    proc = Proc.new &block
    self.select &proc
  end

  def discard &block
    proc = Proc.new &block
    self.reject &proc
  end
end

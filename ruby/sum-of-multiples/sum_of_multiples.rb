class SumOfMultiples
  def initialize(*datas)
    @datas = datas.reject { |data| data < 1 }
  end

  def to(num)
    @datas.flat_map do |data|
      (data...num).step(data).to_a
    end.uniq.sum
  end
end


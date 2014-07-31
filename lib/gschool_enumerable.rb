module GschoolEnumerable

  # def g_each(&block)
  #   for item in self
  #     block.call(item)
  #   end
  #   return self
  # end

  def g_each
    for item in self
      yield(item)
    end
    return self
  end

  def g_select
    array = []
    self.g_each { |item| array << item if yield(item) }
    array
  end

  def g_reject
    array = []
    self.g_each { |item| array << item unless yield(item) }
    array
  end

  def g_map
    array = []
    self.g_each { |item| array << yield(item) }
    array
  end

  def g_find
    array = []
    self.g_each { |item| array << item if yield(item) }
    array.first
  end

  def g_select!
    self.g_each { |item| self.delete(item) unless yield(item)}
  end

end


class CalculatString
  def add(numbers_string)
    return  0 if numbers_string.empty?
    numbers = numbers_string.split(/[\n,]/)
    numbers = numbers.map(&:to_i)
    return numbers.reduce(:+)
  end
end

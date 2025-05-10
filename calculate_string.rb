class CalculatString
  def add(numbers_string)
    return  0 if numbers_string.empty?
    numbers_array = check_multi_delimeter(numbers_string)
    negative_numbers = numbers_array.select { |num| num.to_i.negative? }
    if negative_numbers.any?
      raise RuntimeError, "Negative numbers not allowed: #{negative_numbers.join(',')}"
    end
    
    numbers = numbers_array.map(&:to_i)
    numbers = numbers_ignore_above_1000 numbers
   return  numbers.sum
  end

  private

  def check_multi_delimeter numbers_string
    delimiter = /[\n,]/
    numbers = numbers_string.split(delimiter)
    if  numbers.first.include?('//')
      delimiter = numbers.first.delete('//[]')
      numbers = numbers.last.delete(delimiter).split('')
    end
   
    numbers
  end

  def numbers_ignore_above_1000 numbers
    numbers.map! { |num| num >= 1000 ? 0 : num }
  end
end

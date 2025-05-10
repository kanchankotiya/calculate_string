class CalculatString
  def add(numbers_string)
    delimiter = get_delimiter(numbers_string)
    numbers_without_delimiter = remove_delimiter_prefix(numbers_string)
    numbers_array = numbers_without_delimiter.split(delimiter)
    negative_numbers = numbers_array.select { |num| num.to_i.negative? }
    if negative_numbers.any?
      raise RuntimeError, "Negative numbers not allowed: #{negative_numbers.join(',')}"
    end
   return  numbers_array.map(&:to_i).sum
  end

  private

  def get_delimiter(numbers)
    delimiter = /[\n,]/ # Default delimiter
    if numbers.start_with?("//")
      delimiter_match = numbers.match(/\[(.*?)\]/) #/\[([^\]]+)\]/
      delimiter = Regexp.new(Regexp.escape(delimiter_match[1])) if delimiter_match
    end
    delimiter
  end

  def remove_delimiter_prefix(numbers)
    numbers.gsub!(/^\/\/.*?\n/, '')
    numbers
  end
end

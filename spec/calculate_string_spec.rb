require './calculate_string'

describe CalculatString do
  subject(:calculate_string) {described_class.new}

  describe '#add' do
    it "takes an empty string and returns 0" do 
      expect(calculate_string.add("")).to eq(0)
    end
  end

  it "takes 1 number" do
    expect(calculate_string.add("1")).to eq(1)
  end

  it "takes 2 numbers" do
    expect(calculate_string.add("1,7")).to eq(8)
  end

  it "handles an n amount of numbers" do
    expect(calculate_string.add("1,2,3,4,5,6")).to eq(21)
  end

  it "handles new lines e.g 1\\n2,3" do
    expect(calculate_string.add("1\n2,3")).to eq(6)
  end

  it "can accept delimiters of any length in the following format “//[delimiter]\n[numbers...]”" do
    expect(calculate_string.add("//[;]\n1;2;3")).to eq(6)
  end

  it "throws an exception \"negatives numbers not allowed\" when a negative number is passed" do
    expect{calculate_string.add("-1")}.to raise_error(RuntimeError, "Negative numbers not allowed: -1")
    expect{calculate_string.add("-1,2")}.to raise_error(RuntimeError, "Negative numbers not allowed: -1")
    expect{calculate_string.add("-1,3,-2")}.to raise_error(RuntimeError, "Negative numbers not allowed: -1,-2")
  end

  it "ignores numbers bigger than 1000 e.g. 2 + 1000 = 2" do
    expect(calculate_string.add("1000,2")).to eq(2)
  end
end

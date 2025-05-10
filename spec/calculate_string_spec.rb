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
end

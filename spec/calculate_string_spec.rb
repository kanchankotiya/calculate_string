require './calculate_string'

describe CalculatString do
  subject(:calculate_string) {described_class.new}

  describe '#add' do
    it "takes an empty string and returns 0" do 
      expect(calculate_string.add("")).to eq(0)
    end
  end
end

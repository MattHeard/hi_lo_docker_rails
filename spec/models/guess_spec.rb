require_relative '../../app/models/guess'

def invalid_raw_values
  [nil, '', 'a', 0, 101]
end

def valid_raw_values
  %w[1 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 100]
end

RSpec.describe Guess do
  describe '#valid?' do
    invalid_raw_values.each do |raw_value|
      context "when the raw value is #{raw_value.inspect}" do
        it 'is falsey' do
          expect(Guess.new(raw_value)).to_not be_valid
        end
      end
    end

    valid_raw_values.each do |raw_value|
      context "when the raw value is #{raw_value.inspect}" do
        it 'is truthy' do
          expect(Guess.new(raw_value)).to be_valid
        end
      end
    end
  end
end

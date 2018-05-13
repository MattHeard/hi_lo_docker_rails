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

  describe '#to_i' do
    context 'when invalid' do
      it 'raises an error' do
        guess = Guess.new('0')
        expect { guess.to_i }.to raise_error('The guess is invalid')
      end
    end

    context "when the raw value is '1'" do
      it 'returns 1' do
        guess = Guess.new('1')
        expect(guess.to_i).to eq 1
      end
    end

    context "when the raw value is '2'" do
      it 'returns 2' do
        guess = Guess.new('2')
        expect(guess.to_i).to eq 2
      end
    end
  end
end

class Guess
  def initialize(raw_value)
    @raw_value = raw_value
  end

  def valid?
    valid_values.include?(integral_value)
  end

  def to_i
    raise invalid_error_message unless valid?

    integral_value
  end

  private

  attr_reader :raw_value

  def valid_values
    smallest_valid_value..largest_valid_value
  end

  def smallest_valid_value
    1
  end

  def largest_valid_value
    100
  end

  def integral_value
    raw_value.to_i
  end

  def invalid_error_message
    'The guess is invalid'
  end
end

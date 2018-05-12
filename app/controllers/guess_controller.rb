class Guess
  def initialize(raw_value)
    @raw_value = raw_value
  end

  def to_i
    @raw_value.to_i
  end

  def nonzero?
    to_i.nonzero?
  end

  def valid?
    nonzero?
  end
end

class GuessController < ApplicationController
  def evaluate
    set_response_status
  end

  private

  def set_response_status
    head(valid_guess_given? ? :ok : :bad_request)
  end

  def valid_guess_given?
    guess.valid?
  end

  def guess
    Guess.new(params[:guess])
  end
end

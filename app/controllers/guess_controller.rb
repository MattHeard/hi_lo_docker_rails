class Hint
  def initialize(args = {})
    @guess = args[:guess]
    @target = args[:target]
  end

  def to_s
    too_low? ? 'too low' : 'too high'
  end

  private

  attr_reader :guess, :target

  def too_low?
    guess.to_i < target.to_i
  end
end

class GuessController < ApplicationController
  def evaluate
    set_response_status
  end

  private

  def set_response_status
    if valid_guess_given?
      render json: { 'correct?' => false, 'hint' => hint.to_s }
    else
      head(:bad_request)
    end
  end

  def valid_guess_given?
    guess.valid?
  end

  def guess
    Guess.new(params[:guess])
  end

  def hint
    Hint.new(guess: guess, target: target)
  end

  def target
    params[:target]
  end
end

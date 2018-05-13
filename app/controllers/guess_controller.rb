class GuessController < ApplicationController
  def evaluate
    set_response_status
  end

  private

  def set_response_status
    if valid_guess_given?
      render json: {'correct?' => false, 'hint' => 'too low'}
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
end

class GuessController < ApplicationController
  def evaluate
    set_response_status
  end

  private

  def set_response_status
    head(guess_given? ? :ok : :bad_request)
  end

  def guess_given?
    guess
  end

  def guess
    params[:guess]
  end
end

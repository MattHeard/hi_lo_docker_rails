class GuessController < ApplicationController
  def evaluate
    set_bad_response_response_code 
  end

  private

  def set_bad_response_response_code
    head :bad_request
  end
end

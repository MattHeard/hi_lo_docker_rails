require 'rails_helper'

RSpec.describe 'making guesses', type: :request do
  describe 'GET /guess' do
    context 'with no parameters' do
      it "returns a 'bad request' response" do
        get '/guess'
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'with a valid guess and no state' do
      it "returns an 'ok' response" do
        get '/guess?guess=1'
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

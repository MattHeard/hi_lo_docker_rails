require 'rails_helper'

RSpec.describe 'making guesses', type: :request do
  describe 'GET /guess' do
    context 'with no parameters' do
      it 'fails' do
        get '/guess'
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end

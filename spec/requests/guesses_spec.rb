require 'rails_helper'

RSpec.describe 'making guesses', type: :request do
  describe 'GET /guess' do
    context 'with no parameters' do
      it "returns a 'bad request' response" do
        get '/guess'
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'with a guess of an empty string and no state' do
      it "returns a 'bad request' response" do
        get '/guess?guess='
        expect(response).to have_http_status(:bad_request)
      end
    end

    context 'with a valid guess and no state' do
      it "returns an 'ok' response" do
        get '/guess?guess=1'
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with a guess of 1 and a target of 2' do
      it "returns an 'ok' response" do
        get '/guess?guess=1&target=2'
        expect(response).to have_http_status(:ok)
      end

      it 'reponds that the guess is too low' do
        headers = {
          "ACCEPT" => "application/json"
        }
        get '/guess?guess=1&target=2'
        expected_response = {'correct?' => false, 'hint' => 'too low'}.to_json
        expect(response.body).to eq expected_response
      end
    end

    context 'with a guess of 3 and a target of 2' do
      it "returns an 'ok' response" do
        get '/guess?guess=3&target=2'
        expect(response).to have_http_status(:ok)
      end

      it 'reponds that the guess is too high' do
        headers = {
          "ACCEPT" => "application/json"
        }
        get '/guess?guess=3&target=2'
        expected_response = {'correct?' => false, 'hint' => 'too high'}.to_json
        expect(response.body).to eq expected_response
      end
    end

    context 'with a guess of 2 and a target of 3' do
      it 'reponds that the guess is too low' do
        headers = {
          "ACCEPT" => "application/json"
        }
        get '/guess?guess=2&target=3'
        expected_response = {'correct?' => false, 'hint' => 'too low'}.to_json
        expect(response.body).to eq expected_response
      end
    end
  end
end

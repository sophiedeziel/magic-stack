# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home' do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'contains React application' do
      get '/'
      expect(response.body).to include('react-component')
      expect(response.body).to include('Loading...')
    end
  end
end

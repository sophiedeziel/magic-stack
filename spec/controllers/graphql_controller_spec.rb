# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController do
  describe 'POST #execute' do
    let(:query) { '{ __typename }' }

    it 'returns a success response for valid query' do
      post :execute, params: { query: query }
      expect(response).to be_successful
    end

    it 'returns JSON content type' do
      post :execute, params: { query: query }
      expect(response.content_type).to include('application/json')
    end

    it 'executes GraphQL query' do
      post :execute, params: { query: query }
      json_response = response.parsed_body
      expect(json_response).to have_key('data')
    end
  end
end

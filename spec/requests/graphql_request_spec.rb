# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GraphQL API' do
  describe 'POST /graphql' do
    let(:query) { '{ __typename }' }

    it 'executes GraphQL queries' do
      post '/graphql', params: { query: query }
      expect(response).to have_http_status(:success)

      json_response = response.parsed_body
      expect(json_response).to have_key('data')
    end

    it 'handles invalid queries' do
      post '/graphql', params: { query: 'invalid query' }
      expect(response).to have_http_status(:success)

      json_response = response.parsed_body
      expect(json_response).to have_key('errors')
    end
  end
end

# frozen_string_literal: true

require File.expand_path '../../../spec_helper.rb', __FILE__

RSpec.describe 'List users feature' do
  it 'returns a stub' do
    get '/users'
    expect(last_response).to be_ok
    users = JSON.parse(last_response.body)
    expect(users.length).to eq(1)
    expect(users[0]['login']).to eq('geowa4')
  end
end

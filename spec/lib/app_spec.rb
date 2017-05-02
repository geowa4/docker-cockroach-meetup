# frozen_string_literal: true

require File.expand_path '../../spec_helper.rb', __FILE__

RSpec.describe 'The basics' do
  it 'should return a hello message for root path' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello, World.')
  end

  it 'should return json for 404' do
    get '/thisdoesnotexist'
    expect(last_response).to be_not_found
    expect(last_response['Content-Type']).to eq('application/json')
    expect(JSON.parse(last_response.body)).to eq('error' => 'not found')
  end
end

#!/usr/bin/env ruby
# frozen_string_literal: true
require 'json'
require 'sinatra'
require './lib/features/list_users'

configure do
  set :show_exceptions, false
  set :database,
      adapter: 'postgresql', encoding: 'unicode',
      database: 'your_database_name', pool: 2,
      username: 'your_username', password: 'your_password'
end

get '/' do
  'Hello, World.'
end

not_found do
  content_type :json
  { error: 'not found' }.to_json
end

error do
  content_type :json
  { error: env['sinatra.error'].message }.to_json
end

#!/usr/bin/env ruby
# frozen_string_literal: true
require 'json'
require 'sinatra'
require 'sinatra/activerecord'
require './lib/features/list_users'

configure do
  set :show_exceptions, false
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

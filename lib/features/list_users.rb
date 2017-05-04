# frozen_string_literal: true
require 'digest'
require 'json'
require 'sinatra'
require './lib/models/user'

get '/users' do
  content_type :json
  User.all.to_json
end

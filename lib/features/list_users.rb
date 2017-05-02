# frozen_string_literal: true
require 'digest'
require 'json'
require 'sinatra'

get '/users' do
  content_type :json
  [{ login: 'geowa4' }].to_json
end

# Defines a user
class User
  attr_reader :login, :email, :master_key

  def initialize(login, email)
    @id = nil
    @login = login
    @email = email
    @master_key = nil
  end

  def generate_master_key
    Digest::SHA256.hexdigest(@id)
  end

  def to_json
    { login: @login, email: @email, master_key: @master_key }
  end
end

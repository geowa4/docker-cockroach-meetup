# frozen_string_literal: true

require File.expand_path '../../../spec_helper.rb', __FILE__

RSpec.describe User do
  it 'is valid when provided user and email' do
    user = User.new(login: 'a', email: 'test@example.com')
    expect(user).to be_valid
  end

  it 'is invalid by default' do
    expect(User.new).to be_invalid
  end

  it 'has no master key by default' do
    user = User.new(login: 'a', email: 'test@example.com')
    expect(user.master_key).to be_nil
  end

  it 'creates master key when asked' do
    user = User.create(login: 'a', email: 'test@example.com')
    user.create_master_key
    expect(user.master_key).to be_a(String)
    user.destroy
  end
end

# frozen_string_literal: true
require 'digest'
require 'pg'
require './lib/app'

namespace :users do
  desc 'list users'
  task :list do
    puts User.all.inspect
  end

  desc 'delete everything'
  task :empty do
    puts "Deleted #{User.delete_all} users."
  end

  desc 'seed a user'
  task seed: [:empty] do
    user = User.create(
      login: 'skeleton', email: 'key@example.com'
    )
    user.create_master_key
    Rake::Task['users:list'].invoke
  end
end

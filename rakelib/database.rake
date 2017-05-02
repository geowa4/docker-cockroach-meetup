# frozen_string_literal: true
require 'digest'
require 'pg'

def connect
  conn = PG.connect(
    user: 'skeletonkey', host: 'localhost', port: 5432
  )
  yield conn
  conn.close
end

def select(query, &block)
  connect do |conn|
    conn.exec(query) { |res| res.each(&block) }
  end
end

def set_master_key_for_user(conn, id)
  key = Digest::SHA256.hexdigest(id)
  conn.exec('UPDATE users SET master_key=$1 WHERE id=$2', [key, id])
end

namespace :schema do
  desc 'create users table'
  task :users do
    connect do |conn|
      stmt = 'CREATE TABLE IF NOT EXISTS users ('\
      'id BYTES PRIMARY KEY DEFAULT uuid_v4(),'\
      'login STRING UNIQUE,'\
      'email STRING UNIQUE,'\
      'master_key STRING UNIQUE'\
      ')'
      conn.exec(stmt)
    end
  end
end

namespace :users do
  desc 'list users'
  task :list do
    select('SELECT email, login, master_key FROM users') do |row|
      puts row
    end
  end

  desc 'delete everything'
  task :empty do
    connect do |conn|
      conn.exec('DELETE FROM users')
    end
  end

  desc 'seed users in the database'
  task seed: [:empty] do
    connect do |conn|
      insert = 'INSERT INTO users (login, email) '\
                "VALUES ('skeleton', 'key@example.com') "\
                'RETURNING id'
      select(insert) { |row| set_master_key_for_user(conn, row['id']) }
    end
    Rake::Task['users:list'].invoke
  end
end

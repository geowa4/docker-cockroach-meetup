# frozen_string_literal: true
# Create users table and apply indices.
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_users_table
    add_indexes_to_users_table
  end

  def create_users_table
    create_table :users do |t|
      t.string :login, null: false
      t.string :email, null: false
      t.string :master_key
    end
  end

  def add_indexes_to_users_table
    add_index :users, :login, unique: true
    add_index :users, :email, unique: true
    add_index :users, :master_key, unique: true
  end
end

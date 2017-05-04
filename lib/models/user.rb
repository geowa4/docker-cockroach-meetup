# frozen_string_literal: true
require 'active_record'

# User model
class User < ActiveRecord::Base
  self.primary_key = :id

  validates :login, :email, presence: true

  def create_master_key
    update(master_key: Digest::SHA256.hexdigest(id.to_s))
  end
end

class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  attr_readonly :admin

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end

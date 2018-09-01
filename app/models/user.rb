class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email

  has_many :ratings
end

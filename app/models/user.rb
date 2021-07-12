class User < ApplicationRecord
  has_secure_password

  enum gender: [:male, :female, :nonbinary, :other]

  belongs_to :location
end

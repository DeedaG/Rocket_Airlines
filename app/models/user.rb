class User < ApplicationRecord
  has_secure_password
  has_many :bookings, through: :flights
  has_many :flights
end

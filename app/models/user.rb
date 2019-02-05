class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :flights, through: :bookings

  validates :name, :presence => true

  #scope :paid, -> {where(paid: true)}
end

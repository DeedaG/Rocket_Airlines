class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :user

  scope :paid?, -> { where(paid: "1") }
end

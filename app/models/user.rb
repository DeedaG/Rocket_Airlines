class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_many :flights, through: :bookings

  validates :name, :email, :presence => true
  validates :email, :uniqueness => true
  # def self.sign_in_with_auth(auth)
  #   user = User.find_or_create_by(uid: auth['uid']) do |u|
  #       u.name = auth['info']['name']
  #       u.email = auth['info']['email']
  #       u.image = auth['info']['image']
  #     end
  #   if user
  #     return user
  #   else
  #     user = User.create! do |user|
  #       user.password = 'somethingsecret'
  #       user.password_confirmation = 'somethingsecret'
  #       user.provider = auth['provider']
  #       end
  #     return user
  #   end
  # end
  #
  # def self.sign_in_with_password
  #   if user && user.authenticate(params[:user][:password])
  #     session[:user_id] = user.id
  #     user.save
  #   else
  #     "Invalid Login"
  #   end
  # end

  def self.find_or_create_by_omniauth(auth)
    oauth_email = auth["info"]["email"] || auth["info"]["name"]
    self.where(:email => oauth_email).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

end

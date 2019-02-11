module SessionsHelper

  def sign_in_with_auth(auth)
    user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
      end
    if user
      session[:user_id] = user.id
      user.save
    else
      user = User.create! do |user|
        user.password = 'bojanglesicedtea'
        #user.password_confirmation = 'bojanglesicedtea'
        user.provider = auth['provider']
    end
      session[:user_id] = user.id
      user.save
    end
  end

  def sign_in_with_password(user)
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      user.save
    else
      "Invalid Login"
    end
  end

      #user.provider.nil? will be true only if it is not a social login user
end

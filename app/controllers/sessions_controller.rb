class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth
      user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end
      helpers.sign_in_with_auth(auth)
      user.save
      redirect_to user_path(user)
    else
      user = User.find_by(name: params[:user][:name])
      helpers.sign_in_with_password
      redirect_to user_path(user)
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

    def auth
      request.env['omniauth.auth']
    end

end

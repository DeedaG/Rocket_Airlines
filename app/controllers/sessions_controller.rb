class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  # def create
  #     auth = request.env["omniauth.auth"]
  #   if auth
  #     @user = User.sign_in_with_auth(auth)
  #     session[:user_id] = @user.id
  #     @user.save
  #     redirect_to user_path(@user)
  #   else
  #     @user = User.find_by(name: params[:user][:name])
  #     if @user && @user.authenticate(params[:user][:password])
  #       session[:user_id] = @user.id
  #       @user.save
  #       redirect_to user_path(@user)
  #     else
  #       "Invalid Login"
  #     end
  #   end
  # end

    #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #       u.name = auth['info']['name']
    #       u.email = auth['info']['email']
    #       u.image = auth['info']['image']
    #     end
    #   if @user
    #     session[:user_id] = @user.id
    #     @user.save
    #     redirect_to user_path(@user)
    #   else
    #     helpers.sign_in_with_auth(auth)
    #     redirect_to user_path(@user)
    #   end
    # else
    #   @user = (User.find_by(name: params[:user][:name]))
    #   helpers.sign_in_with_password(@user)
    #   #raise params.inspect
    #   redirect_to user_path(@user)
    # end
  #end

  def create
    @user = User.new
    @users = User.all

    if auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      user = User.find_or_create_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render :new
      end
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

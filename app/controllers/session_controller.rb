class SessionController < ApplicationController
  def new
  end

  def create
    user =  User.where( :username => params[:username ] ).first
    if user.present? && user.authenticate( params[:password] )
      session[:user_id] = user.id
      redirect_to(user)
    else
      flash[:notice] = "Oops. Something went wrong."
      redirect_to(login_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
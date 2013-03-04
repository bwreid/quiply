class UsersController < ApplicationController
  before_filter :is_logged_in, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(@user)
    else
      render :new
    end
  end

  def edit
    @user = @auth
  end

  def update
    @user = @auth
    if @user.update_attributes(params[:user])
      redirect_to(@user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
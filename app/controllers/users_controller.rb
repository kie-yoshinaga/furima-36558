class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
  end

end

class UsersController < ApplicationController

  def new
    @user = User.new
    @categories = Category.all
  end

end

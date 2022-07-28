class UserController < ApplicationController
  def show
    @user = current_user.events
  end
end

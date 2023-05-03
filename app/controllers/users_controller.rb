class UsersController < ApplicationController
  def dash_boards
    @user = current_user
  end
end

class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    id = params[:id].to_i
    @user = User.find_by(id)
    #render error here unless @user
end

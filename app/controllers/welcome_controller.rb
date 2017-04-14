class WelcomeController < ApplicationController
  
  def index
    @movies = Work.where(category: "movie")
    @books = Work.where(category: "book")
    @albums = Work.where(category: "album")
    # @highest_vote =
    #instance variable for each category + best
  end

  def login
    #if user exists find_by name
  #else create new user
  User.save
  redirect to root_path
  end

  def logout
    redirect to root_path
  end

  #maybe will need to add a login form?
end

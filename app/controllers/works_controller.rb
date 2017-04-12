class WorksController < ApplicationController
  def index
    #create variable which looks up work by category use .order(votescount: :desc order)
  end

  def new
    @work = Work.new(category: #work category instance variable)
  end

  def create
  end

  def show
  end

  def updated
  end

  def upvote
  end

  def destroy
  end

  private

  def work_params
  end
end

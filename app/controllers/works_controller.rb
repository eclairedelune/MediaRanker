class WorksController < ApplicationController
  def index
    #create variable which looks up work by category use .order(votescount: :desc order)
    @works = Work.all
    @works.order(vote_count: :desc) #should I add a vote column to store vote count?
    render :index

    # I need to add a by category method but not sure whether to add it here or model...
  end

  # def new
  #   @work = Work.new(category: @work_category)#work category instance variable)
  # end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find_by(category: params[:category])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect to work_path(work)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy

    redirect_to works_path
  end

  def upvote
    @work = Work.find(params[:id])
  @work.votes.create
  redirect_to(works_path)
  end

  private
  def work_params
    return params.require(:work).permit(:title, :creator, :description)
  end
end

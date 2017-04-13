require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get works_index_url
  #   assert_response :success
  # end  #this auto generated, whould I keep it? why?
  describe WorksController do
    describe "index" do
      it "Responds successfully" do
        Work.count.must_be :>, 0
        get works_path
        must_respond_with :success
      end

      it "responds even when there is no media (work)" do
        Work.destroy_all
        get works_path
        must_respond_with :success
      end

    end

    describe "create" do
      it "adds a work to the database" do
        work_data = {
          work: {
            category: "book",
            title: "test book",
            creator: "someone",
            publication_date: "3084",
            description: "some stuff"
          }
        }
        post works_path, params: work_data
        must_redirect_to works_path
      end

      it "shows the new work form again if the work is invalid" do
        work_data = {
          work: {
            category: "book",
            title: "test book",
            creator: "someone",
            publication_date: "3084",
            description: "some stuff"
          }
        }
        post works_path, params: work_data
        must_respond_with :bad_request
      end
    end

    describe "show" do
      it "shows a media that exists" do
        work = Work.first
        get work_path(work)
        must_respond_with :success
      end

      it "return a 404 if the book doesn't exist" do
        work_id = Work.last.id
        work_id += 1
        get work_path(work_id)

        must_respond_with :not_found
      end
    end
  end

end

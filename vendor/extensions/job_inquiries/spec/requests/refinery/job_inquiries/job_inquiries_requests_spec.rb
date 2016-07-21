require "spec_helper"

module Refinery
  module JobInquiries

    describe "JobInquiries request specs", type: :request do

      before(:each) do
        Refinery::JobInquiries::Engine.load_seed
      end

      it "successfully gets the index path as redirection" do
        get("/job_inquiries")
        expect(response).to be_redirect
        expect(response).to redirect_to("/job_inquiries/new")
      end

      it "successfully gets the new path" do
        get("/job_inquiries/new")
        expect(response).to be_success
        expect(response).to render_template(:new)
      end

      it "successfully gets the thank_you path" do
        get("/job_inquiries/thank_you")
        expect(response).to be_success
        expect(response).to render_template(:thank_you)
      end

    end
  end
end

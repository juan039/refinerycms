require "spec_helper"

module Refinery
  module JobInquiries
    describe JobInquiriesController, type: :controller do

      before do
        @route = Refinery::JobInquiries::Engine.routes
        Refinery::JobInquiries::Engine::load_seed

        @new_page = Refinery::Page.new
        allow(Refinery::Page).to receive_messages(:where => [ @new_page ])
      end

      describe "GET new" do
        it "before_filter assigns a new job_inquiry" do
          get :new
          expect(assigns(:job_inquiry)).to be_a_new(JobInquiry)
        end
        it "before_filter assigns page to job_inquiries/new" do
          get :new
          expect(assigns(:page)).to eq @new_page
        end
      end

      describe "POST create" do

        before{
          allow_any_instance_of(JobInquiry).to receive(:save).and_return( true )
        }


        it "before_filter assigns page to job_inquiries/new" do
          post :create, job_inquiry: {name: "foo", , job_type: "foo", brochure: false, qualification: "foo"}
          expect(assigns(:page)).to eq @new_page
        end

        it "before_filter assigns a new job_inquiry" do
          post :create, job_inquiry: {name: "foo", , job_type: "foo", brochure: false, qualification: "foo"}
          expect(assigns(:job_inquiry)).to be_a_new(JobInquiry)
        end

        it "redirects to thank_you" do
          post :create, job_inquiry: {name: "foo", , job_type: "foo", brochure: false, qualification: "foo"}
          expect(response).to redirect_to "/job_inquiries/thank_you"
        end

        describe "when it can't save the job_inquiry" do

          before {
          allow_any_instance_of(JobInquiry).to receive(:save).and_return( false )
          }

          it "redirects to new if it can't save" do
            post :create, job_inquiry: {name: "foo", , job_type: "foo", brochure: false, qualification: "foo"}

            expect(response).to render_template(:new)
          end
        end

      end
    end
  end
end

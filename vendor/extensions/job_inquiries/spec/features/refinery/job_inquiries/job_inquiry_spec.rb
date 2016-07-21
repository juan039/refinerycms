# encoding: utf-8
require "spec_helper"

module Refinery
  module JobInquiries
    describe "job_inquiries", type: :feature do

      before(:each) do
        Refinery::JobInquiries::Engine::load_seed
      end

      describe "Create job_inquiry" do

        before do
          visit refinery.new_job_inquiries_job_inquiry_path
        end

        it "should create a new item" do
          fill_in "job_inquiry_name", :with => "Test"
          fill_in "job_inquiry_message", :with => "Test"
          fill_in "job_inquiry_job_type", :with => "Test"
          fill_in "job_inquiry_qualification", :with => "Test"

          click_button ::I18n.t('.refinery.job_inquiries.job_inquiries.new.send')

          expect(page).to have_content("Thank You")
          expect(Refinery::JobInquiries::JobInquiry.count).to eq(1)
        end
      end
    end
  end
end


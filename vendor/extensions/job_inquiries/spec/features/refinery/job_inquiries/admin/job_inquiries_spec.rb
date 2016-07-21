# encoding: utf-8
require "spec_helper"

module Refinery
  module JobInquiries
    module Admin
      describe JobInquiry, type: :feature do
        refinery_login_with :refinery_user

       describe "job_inquiries list" do
          before do
            FactoryGirl.create(:job_inquiry, :name => "UniqueTitleOne")
            FactoryGirl.create(:job_inquiry, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.job_inquiries_admin_job_inquiries_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

       describe "show" do
         let!(:job_inquiry) do
            FactoryGirl.create(:job_inquiry, :name => "UniqueTitleOne")
          end

         it "has expected text and menu" do
           visit refinery.job_inquiries_admin_job_inquiries_path

           click_link "Read the job_inquiry"

           expect(page).to have_content("UniqueTitleOne")
           expect(page).not_to have_content("UniqueTitleTwo")

           within "#actions" do
             expect(page).to have_content("Age")
             expect(page).to have_content("Back to all job_inquiries")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/job_inquiries']")
             expect(page).to have_content("Remove this job_inquiry forever")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/job_inquiries/#{job_inquiry.id}']")
           end
         end
       end

       describe "when no " do
         before { Refinery::JobInquiries::JobInquiry.destroy_all }

         context "job_inquiries" do
           it "shows expected message" do
            visit refinery.job_inquiries_admin_job_inquiries_path

            expect(page).to have_content("You have not received any job_inquiries yet.")

            end
           end

     end

      describe "action links" do
        before { visit refinery.job_inquiries_admin_job_inquiries_path }

        specify "in the side pane" do
          within "#actions" do
            expect(page).to have_content("Inbox")
            expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/job_inquiries']")

            expect(page).to have_content("Update who gets notified")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/job_inquiries/settings/job_inquiry_notification_recipients/edit']")
            expect(page).to have_content("Edit confirmation email")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/job_inquiries/settings/job_inquiry_confirmation_message/edit']")
          end
        end
      end



        describe "destroy" do
          before { FactoryGirl.create(:job_inquiry, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.job_inquiries_admin_job_inquiries_path

            click_link "Remove this job inquiry forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::JobInquiries::JobInquiry.count).to eq 0
          end
        end

          describe "destroy from job_inquiry show page" do
          before { FactoryGirl.create(:job_inquiry, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.job_inquiries_admin_job_inquiry_path( :id => '1')

            click_link "Remove this job inquiry forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::JobInquiries::JobInquiry.count).to eq 0
          end
          end

      end
    end
  end
end

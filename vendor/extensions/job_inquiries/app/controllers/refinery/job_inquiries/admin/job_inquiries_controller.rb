module Refinery
  module JobInquiries
    module Admin
      class JobInquiriesController < Refinery::AdminController

        crudify :'refinery/job_inquiries/job_inquiry', 
                :title_attribute => "name", 
                :order => "created_at DESC"

        def index
          if searching?
            search_all_job_inquiries
          else
            find_all_job_inquiries
          end

          @grouped_job_inquiries = group_by_date(@job_inquiries)
        end


        private

        # Only allow a trusted parameter "white list" through.
        def job_inquiry_params
          params.require(:job_inquiry).permit(:name, :message, :job_type, :brochure, :qualification)
        end
      end
    end
  end
end

module Refinery
  module JobInquiries
    class JobInquiriesController < ::ApplicationController

      before_action :find_page, :only => [:create, :new]

      def index
        redirect_to refinery.new_job_inquiries_job_inquiry_path
      end

      def thank_you
        @page = Refinery::Page.where(link_url: "/job_inquiries/thank_you").first
      end

      def new
        @job_inquiry = JobInquiry.new
      end

      def create
        @job_inquiry = JobInquiry.new(job_inquiry_params)

        if @job_inquiry.save
          begin
            Mailer.notification(@job_inquiry, request).deliver_now
          rescue => e
            logger.warn "There was an error delivering the job_inquiry notification.\n#{e.message}\n"
          end

          if JobInquiry.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@job_inquiry, request).deliver_now
            rescue => e
              logger.warn "There was an error delivering the job_inquiry confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to JobInquiry if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_job_inquiries_job_inquiries_path
        else
          render :action => 'new'
        end
      end

      protected

      def find_page
        @page = Refinery::Page.where(link_url: "/job_inquiries/new").first
      end

      private

    # Only allow a trusted parameter "white list" through.
      def job_inquiry_params
        params.require(:job_inquiry).permit(:name, :message, :job_type, :brochure, :qualification)
      end
    end
  end
end

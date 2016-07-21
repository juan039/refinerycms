
module Refinery
  module JobInquiries
    class JobInquiry < Refinery::Core::BaseModel
      self.table_name = 'refinery_job_inquiries'



      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :name, :presence => true

      JOB_TYPES = ["Tecnico","Profesional","Master of Puppets"]

      QUALIFICATIONS = ["Bueno","Muy Bueno","AWESOME!!"]
    end
  end
end

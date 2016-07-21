module Refinery
  module JobInquiries
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::JobInquiries

      engine_name :refinery_job_inquiries

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "job_inquiries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.job_inquiries_admin_job_inquiries_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::JobInquiries)
      end
    end
  end
end

module Refinery
  module Cursos
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Cursos

      engine_name :refinery_cursos

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "cursos"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.cursos_admin_cursos_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Cursos)
      end
    end
  end
end

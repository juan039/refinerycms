module Refinery
  module Cursos
    module Admin
      class CursosController < ::Refinery::AdminController

        crudify :'refinery/cursos/curso',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def curso_params
          params.require(:curso).permit(:name, :start_date, :price, :photo_id, :description)
        end
      end
    end
  end
end

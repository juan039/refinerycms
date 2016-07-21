module Refinery
  module Cursos
    class CursosController < ::ApplicationController

      before_action :find_all_cursos
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @curso in the line below:
        present(@page)
      end

      def show
        @curso = Curso.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @curso in the line below:
        present(@page)
      end

    protected

      def find_all_cursos
        @cursos = Curso.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/cursos").first
      end

    end
  end
end

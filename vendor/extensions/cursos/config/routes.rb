Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :cursos do
    resources :cursos, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :cursos, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :cursos, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end

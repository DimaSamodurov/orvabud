::Refinery::Application.routes.draw do
  resources :galleries, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :galleries, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :sections, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :sections, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

end

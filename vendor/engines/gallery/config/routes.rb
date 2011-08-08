::Refinery::Application.routes.draw do
  scope(:path => 'gallery', :module => 'gallery') do
    root :to => 'entries#index', :as => 'gallery_root'
    match ':id', :to => 'entries#show', :as => 'gallery_entry'
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    scope(:path => 'gallery', :as => 'gallery', :module => 'gallery') do

      root :to => 'entries#index'
      
      resources :entries, :except => :show do
        collection do
          post :update_positions
        end
      end

      resources :sections, :except => :show do
        collection do
          post :update_positions
        end
      end
      
    end

  end
  
end

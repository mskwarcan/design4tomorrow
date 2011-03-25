Refinery::Application.routes.draw do
  resources :sign_ups, :only => [:index, :create]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :sign_ups, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end

Rails.application.routes.draw do
  #resources :patients, except: :destroy
  #resources :patients, only: :index
  #resources :patients

  #resources :patients, constraints: { subdomain: 'api' }
  #http://api.myadomain/patients

  #with_options only: :index do |resource|
    #resource.resources :patients
    #resource.resources :events
  #end

  constraints do
    namespace :api, path: '/' do
      resources :patients, format: :json

      namespace :v1 do
        resources :patients do
          collection do
            get :get_version
          end
        end
      end

      namespace :v2 do
        resources :patients do
          collection do
            get :get_version
          end
        end
      end

      namespace :v3 do
        resources :patients
      end
    end
  end
end

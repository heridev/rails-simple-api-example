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

  constraints subdomain: 'api' do
    namespace :api, path: '/' do
      resources :patients
    end
  end
end

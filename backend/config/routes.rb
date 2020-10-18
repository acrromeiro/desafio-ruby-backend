Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/import',  to: 'imports#create'
  get '/stores', to: 'stores#list', :defaults => { :format => :json }
  get '/stores/:id/transactions', to: 'stores#transactions', :defaults => { :format => :json }
end

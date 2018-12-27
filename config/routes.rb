Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'

  scope '/api' do
    scope '/v1' do
      scope '/notes' do
        get '/' => 'api_notes#index'
        post '/' => 'api_notes#create'
        scope '/search' do
          get '/' => 'api_notes#search'
        end
        scope '/:id' do
          get '/' => 'api_notes#show'
          put '/' => 'api_notes#update'
          delete '/' => 'api_notes#delete'
        end
      end
    end
  end

end

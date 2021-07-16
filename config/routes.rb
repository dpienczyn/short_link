Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      post :auth, controller: :user_token, action: :create
      resources :links
    end
  end

  match '/url/:url_digest', controller: :pages, action: :redirect_to_url, via: :get
end

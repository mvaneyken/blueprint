Blueprint::Application.routes.draw do

  devise_for :users

  scope "(:locale)", :locale => /en|fr/ do
    resources :pages do
      collection do
        get :welcome
      end
    end
    authenticated :user do
      resources :users
    end
  end

  root :to => 'pages#welcome', :as => 'home'

end

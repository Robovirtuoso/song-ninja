SongNinja::Application.routes.draw do

  authenticated :user do
    root :to => 'song_creation_services#new'
  end

  root :to => "home#index"

  devise_for :users

  resources :users do
    resources :bands do
      resources :songs
    end

    resources :song_creation_services
  end
end

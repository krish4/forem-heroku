ForemHeroku::Application.routes.draw do
  get "/success" => "sessions#success", :as  => :success
  mount Forem::Engine, :at => "/forums"
  mount OmniauthSingleSignon::Engine => ""
  get 'auth/single_signon', :as => :sign_in

  root :to => 'sessions#new'
end

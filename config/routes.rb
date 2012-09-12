ForemHeroku::Application.routes.draw do
  mount Forem::Engine, :at => "/forums"
  mount OmniauthSingleSignon::Engine => ""
  get 'auth/single_signon', :as => :sign_in
end

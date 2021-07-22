Rails.application.routes.draw do
  resources :atividades
  resources :projetos

  root :to => "projetos#index"
end

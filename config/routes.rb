Rails.application.routes.draw do
  
  get "up" => "rails/health#show", as: :rails_health_check

  get "/pacientes/:cpf", to: "pacientes#show", constraints: { cpf: /[0-9\.\-]+/ }

  resources :pacientes
  resources :equipamentos
  resources :observacoes
  resources :usuarios
  resources :equipamento_pacientes
  resources :enderecos
end
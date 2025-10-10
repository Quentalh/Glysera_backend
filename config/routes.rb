Rails.application.routes.draw do
  
  get "up" => "rails/health#show", as: :rails_health_check

  get "/pacientes/:cpf", to: "pacientes#show", constraints: { cpf: /[0-9\.\-]+/ }

  post "/emissao_formulario", to: "emissao_formulario#create"

  resources :pacientes
  resources :equipamentos
  resources :observacoes
  resources :unidade_de_saudes, only: [:index]
  resources :usuarios
  resources :equipamento_pacientes
  resources :enderecos
end
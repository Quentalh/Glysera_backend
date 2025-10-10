# app/controllers/unidade_de_saudes_controller.rb
class UnidadeDeSaudesController < ApplicationController
  # GET /unidade_de_saudes
  def index
    @unidades = UnidadeDeSaude.all
    render json: {
      status: "success",
      data: @unidades
    }, status: :ok
  end
end
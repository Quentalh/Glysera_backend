class UnidadeDeSaudesController < ApplicationController
  def index
    @unidades = UnidadeDeSaude.all
    render json: {
      status: "success",
      data: @unidades
    }, status: :ok
  end
end
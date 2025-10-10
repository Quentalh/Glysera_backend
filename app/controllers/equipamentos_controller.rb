class EquipamentosController < ApplicationController
  before_action :set_equipamento, only: [:show, :update, :destroy]

  def index
    @equipamentos = Equipamento.includes(:observacoes).all
    render json: {
      status: "success",
      data: @equipamentos.as_json(include: :observacoes)
    }, status: :ok
  end

  def show
    if @equipamento
      render json: {
        status: "success",
        data: @equipamento.as_json(include: :observacoes)
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Equipamento não encontrado"
      }, status: :not_found
    end
  end

  def create
    @equipamento = Equipamento.new(equipamento_params)

    if @equipamento.save
      render json: {
        status: "success",
        message: "Equipamento criado com sucesso!",
        data: @equipamento.as_json(include: :observacoes)
      }, status: :created
    else
      render json: {
        status: "error",
        message: "Não foi possível criar o equipamento.",
        errors: @equipamento.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def update
    if @equipamento.update(equipamento_params)
      render json: {
        status: "success",
        message: "Equipamento atualizado com sucesso!",
        data: @equipamento
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível atualizar o equipamento.",
        errors: @equipamento.errors.full_messages
      }, status: :unprocessable_entity
    end
  end


  def destroy
    if @equipamento.destroy
      render json: {
        status: "success",
        message: "Equipamento excluído com sucesso!"
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível excluir o equipamento."
      }, status: :unprocessable_entity
    end
  end

  private

  def set_equipamento
    @equipamento = Equipamento.includes(:observacoes).find_by(numero_de_serie: params[:id])
    @equipamento ||= Equipamento.includes(:observacoes).find_by(id: params[:id])
  end

  def equipamento_params
    params.require(:equipamento).permit(
      :marca,
      :modelo,
      :numero_de_serie,
      :data,
      observacoes_attributes: [:id, :texto, :arquivo, :_destroy]
    )
  end
end
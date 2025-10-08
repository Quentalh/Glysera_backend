class EquipamentosController < ApplicationController
  before_action :set_equipamento, only: [:show, :update, :destroy]

  # GET /equipamentos
  def index
    @equipamentos = Equipamento.all
    render json: {
      status: "success",
      data: @equipamentos
    }, status: :ok
  end

  # GET /equipamentos/:id
  def show
    render json: {
      status: "success",
      data: @equipamento
    }, status: :ok
  end

  # POST /equipamentos
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
  # PATCH/PUT /equipamentos/:id
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

  # DELETE /equipamentos/:id
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
    @equipamento = Equipamento.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      status: "error",
      message: "Equipamento não encontrado"
    }, status: :not_found
  end

  def equipamento_params
    params.require(:equipamento).permit(
      :marca,
      :modelo,
      :numero_de_serie,
      :data,
      observacoes_attributes: [:id, :descricao, :arquivo, :_destroy]
    )
  end
end
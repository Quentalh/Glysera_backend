class ObservacoesController < ApplicationController
  before_action :set_observacao, only: [:show, :update, :destroy]

  # GET /observacoes
  def index
    @observacoes = Observacao.all
    render json: {
      status: "success",
      data: @observacoes
    }, status: :ok
  end

  # GET /observacoes/:id
  def show
    render json: {
      status: "success",
      data: @observacao
    }, status: :ok
  end

  # POST /observacoes
  def create
    @equipamento = Equipamento.find(observacao_params[:equipamento_id])
    @observacao = @equipamento.observacoes.build(observacao_params)

    if @observacao.save
      render json: {
        status: "success",
        message: "Observação criada com sucesso!",
        data: @observacao
      }, status: :created
    else
      render json: {
        status: "error",
        message: "Não foi possível criar a observação.",
        errors: @observacao.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /observacoes/:id
  def update
    if @observacao.update(observacao_params)
      render json: {
        status: "success",
        message: "Observação atualizada com sucesso!",
        data: @observacao
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível atualizar a observação.",
        errors: @observacao.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # DELETE /observacoes/:id
  def destroy
    if @observacao.destroy
      render json: {
        status: "success",
        message: "Observação excluída com sucesso!"
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível excluir a observação."
      }, status: :unprocessable_entity
    end
  end

  private

  def set_observacao
    @observacao = Observacao.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      status: "error",
      message: "Observação não encontrada"
    }, status: :not_found
  end

  def observacao_params
  params.require(:observacao).permit(:texto, :equipamento_id, :arquivo)
  end
end
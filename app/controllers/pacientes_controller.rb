# app/controllers/pacientes_controller.rb
class PacientesController < ApplicationController
  before_action :set_paciente, only: [:show, :update, :destroy]

  def index
    @pacientes = Paciente.includes(:equipamentos, :endereco).all
    render json: {
      status: "success",
      data: @pacientes.as_json(include: [:endereco, :equipamentos])
    }, status: :ok
  end

  def show
    if @paciente
      render json: {
        status: "success",
        data: {
          paciente: @paciente.as_json(include: :endereco),
          equipamentos: @paciente.equipamentos
        }
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Paciente não encontrado"
      }, status: :not_found
    end
  end

  # POST /pacientes
  def create
    ActiveRecord::Base.transaction do
      @endereco = Endereco.create!(endereco_params)
      @paciente = Paciente.create!(paciente_params.merge(endereco_id: @endereco.id))
    end

    render json: {
      status: "success",
      message: "Paciente e endereço criados com sucesso!",
      data: @paciente
    }, status: :created

  rescue ActiveRecord::RecordInvalid => e
    render json: {
      status: "error",
      message: "Não foi possível criar o paciente.",
      errors: e.record.errors.full_messages
    }, status: :unprocessable_entity
  end

  def update
    @endereco = @paciente.endereco

    ActiveRecord::Base.transaction do
      @paciente.update!(paciente_params)
      @endereco.update!(endereco_params)
    end

    render json: {
      status: "success",
      message: "Paciente e endereço atualizados com sucesso!",
      data: @paciente.as_json(include: :endereco)
    }, status: :ok

  rescue ActiveRecord::RecordInvalid => e
    render json: {
      status: "error",
      message: "Não foi possível atualizar o cadastro.",
      errors: e.record.errors.full_messages
    }, status: :unprocessable_entity
  end

  def destroy
    if @paciente.destroy
      render json: {
        status: "success",
        message: "Paciente excluído com sucesso!"
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível excluir o paciente.",
        errors: @paciente.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  private

  def set_paciente
    @paciente = Paciente.includes(:endereco, :equipamentos).find_by(cpf: params[:cpf])
    @paciente ||= Paciente.find_by(id: params[:id])
  end

  def paciente_params
    params.require(:paciente).permit(:nome, :nome_social, :nome_mae, :cpf, :nascimento_date, :sexo)
  end

  def endereco_params
    params.require(:endereco).permit(:cep, :rua, :bairro, :cidade, :estado, :numero, :complemento)
  end
end
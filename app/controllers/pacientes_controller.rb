class PacientesController < ApplicationController
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

  def show
    @paciente = Paciente.find_by(cpf: params[:cpf])

    if @paciente
      @equipamento = @paciente.equipamento

      render json: {
        status: "success",
        data: {
          paciente: @paciente,
          equipamento: @equipamento
        }
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Paciente não encontrado"
      }, status: :not_found
    end
  end

  private

  def paciente_params
    params.require(:paciente).permit(:nome, :cpf, :email, :telefone, :data_nascimento)
  end

  def endereco_params
    params.require(:endereco).permit(:rua, :numero, :bairro, :cidade, :estado, :cep)
  end
end

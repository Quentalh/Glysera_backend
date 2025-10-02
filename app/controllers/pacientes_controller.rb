class PacientesController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      # The .merge(usuario_id: 1) is no longer needed.
      @endereco = Endereco.create!(endereco_params)
      @paciente = Paciente.create!(paciente_params.merge(endereco_id: @endereco.id))
    end

    render json: {
      status: 'success',
      message: 'Paciente e endereço criados com sucesso!',
      data: @paciente
    }, status: :created

  rescue ActiveRecord::RecordInvalid => e
    render json: {
      status: 'error',
      message: 'Não foi possível criar o paciente.',
      errors: e.record.errors.full_messages
    }, status: :unprocessable_entity
  end

  private

  def paciente_params
    params.require(:paciente).permit(:nome, :nome_social, :nome_mae, :cpf, :nascimento_date)
  end

  def endereco_params
    params.require(:endereco).permit(:cep, :rua, :bairro, :cidade, :estado, :numero, :complemento)
  end
end
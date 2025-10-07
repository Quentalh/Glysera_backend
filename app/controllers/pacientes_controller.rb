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
    # Use .includes to prevent extra database queries (N+1 problem)
    @paciente = Paciente.includes(:endereco, :equipamento).find_by(cpf: params[:cpf])
  
    if @paciente
      render json: {
        status: "success",
        data: {
          # Use as_json to include the associated endereco in the response
          paciente: @paciente.as_json(include: :endereco),
          equipamento: @paciente.equipamento
        }
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Paciente não encontrado"
      }, status: :not_found
    end
  end
  
  # NEW fully editable update action
  def update
    @paciente = Paciente.find(params[:id])
    @endereco = @paciente.endereco
  
    # Use a transaction to ensure both updates succeed or neither do.
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
end
  
  private
  
  # Ensure your params methods permit all the fields.
  # These should be the same as for your create action.
  def paciente_params
    params.require(:paciente).permit(:nome, :nome_social, :nome_mae, :cpf, :nascimento_date, :sexo) # Added :sexo
  end
  
  def endereco_params
    params.require(:endereco).permit(:cep, :rua, :bairro, :cidade, :estado, :numero, :complemento)
  end

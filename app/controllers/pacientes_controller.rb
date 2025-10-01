class PacientesController < ApplicationController
  def create
    @paciente = Paciente.new(paciente_params)
    if @paciente.save
      render json: { 
        status: 'success', 
        message: 'Paciente criado com sucesso!', 
        data: @paciente 
      }, status: :created
    else
      render json: { 
        status: 'error', 
        message: 'Não foi possível criar o paciente.', 
        errors: @paciente.errors.full_messages 
      }, status: :unprocessable_entity
    end
  end
end

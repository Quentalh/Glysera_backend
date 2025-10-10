# app/controllers/equipamento_pacientes_controller.rb
class EquipamentoPacientesController < ApplicationController
  before_action :set_equipamento_paciente, only: [:destroy]


  def index
    @equipamento_pacientes = EquipamentoPaciente.all
    render json: {
      status: "success",
      data: @equipamento_pacientes
    }, status: :ok
  end


  def create
    @equipamento_paciente = EquipamentoPaciente.new(equipamento_paciente_params)

    if @equipamento_paciente.save
      render json: {
        status: "success",
        message: "Associação entre equipamento e paciente criada com sucesso!",
        data: @equipamento_paciente
      }, status: :created
    else
      render json: {
        status: "error",
        message: "Não foi possível criar a associação.",
        errors: @equipamento_paciente.errors.full_messages
      }, status: :unprocessable_entity
    end
  end


  def destroy
    if @equipamento_paciente.destroy
      render json: {
        status: "success",
        message: "Associação entre equipamento e paciente removida com sucesso!"
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível remover a associação."
      }, status: :unprocessable_entity
    end
  end

  private

  def set_equipamento_paciente
    @equipamento_paciente = EquipamentoPaciente.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      status: "error",
      message: "Associação não encontrada"
    }, status: :not_found
  end

  def equipamento_paciente_params
    params.require(:equipamento_paciente).permit(:paciente_id, :equipamento_id, :unidade_de_saude_id)
  end
end
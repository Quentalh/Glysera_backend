## app/controllers/emissao_formulario_controller.rb
require "prawn"

class EmissaoFormularioController < ApplicationController
  def create
    paciente = Paciente.find(params[:paciente_id])
    equipamento = Equipamento.find(params[:equipamento_id])
    unidade_de_saude = UnidadeDeSaude.find(params[:unidade_de_saude_id])

    EquipamentoPaciente.create!(
     paciente_id: paciente.id,
     equipamento_id: equipamento.id,
     unidade_de_saude_id: unidade_de_saude.id
   )

    pdf = generate_pdf(paciente, equipamento, unidade_de_saude)

    send_data pdf.render,
              filename: "formulario_#{paciente.cpf}.pdf",
              type: "application/pdf",
              disposition: "attachment"
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Paciente, Equipamento ou Unidade de Saúde não encontrado" }, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: "Erro ao criar associação: #{e.message}" }, status: :unprocessable_entity
  end

  private

  def generate_pdf(paciente, equipamento, unidade_de_saude)
    Prawn::Document.new do
        font_size 24
        text "Comprovante de Vínculo de Equipamento", align: :center
        move_down 40

        font_size 16
        text "Dados da Unidade de Saúde", style: :bold
        stroke_horizontal_rule
        move_down 10
        font_size 12
        text "<b>Nome:</b> #{unidade_de_saude.nome}", inline_format: true
        text "<b>US:</b> #{unidade_de_saude.us}", inline_format: true 
        move_down 30

        font_size 16
        text "Dados do Paciente", style: :bold
        stroke_horizontal_rule
        move_down 10
        font_size 12
        text "<b>Nome:</b> #{paciente.nome}", inline_format: true
        text "<b>CPF:</b> #{paciente.cpf}", inline_format: true
        text "<b>Data de Nascimento:</b> #{paciente.nascimento_date.strftime('%d/%m/%Y')}", inline_format: true
        move_down 30

        font_size 16
        text "Dados do Equipamento", style: :bold
        stroke_horizontal_rule
        move_down 10
        font_size 12
        text "<b>Marca:</b> #{equipamento.marca}", inline_format: true
        text "<b>Modelo:</b> #{equipamento.modelo}", inline_format: true
        text "<b>Número de Série:</b> #{equipamento.numero_de_serie}", inline_format: true
    end
  end
end
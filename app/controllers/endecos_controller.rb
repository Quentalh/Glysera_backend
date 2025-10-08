class EnderecosController < ApplicationController
  before_action :set_endereco, only: [:show, :update, :destroy]

  # GET /enderecos
  def index
    @enderecos = Endereco.all
    render json: {
      status: "success",
      data: @enderecos
    }, status: :ok
  end

  # GET /enderecos/:id
  def show
    render json: {
      status: "success",
      data: @endereco
    }, status: :ok
  end

  # POST /enderecos
  def create
    @endereco = Endereco.new(endereco_params)

    if @endereco.save
      render json: {
        status: "success",
        message: "Endereço criado com sucesso!",
        data: @endereco
      }, status: :created
    else
      render json: {
        status: "error",
        message: "Não foi possível criar o endereço.",
        errors: @endereco.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enderecos/:id
  def update
    if @endereco.update(endereco_params)
      render json: {
        status: "success",
        message: "Endereço atualizado com sucesso!",
        data: @endereco
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível atualizar o endereço.",
        errors: @endereco.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # DELETE /enderecos/:id
  def destroy
    if @endereco.destroy
      render json: {
        status: "success",
        message: "Endereço excluído com sucesso!"
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível excluir o endereço."
      }, status: :unprocessable_entity
    end
  end

  private

  def set_endereco
    @endereco = Endereco.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      status: "error",
      message: "Endereço não encontrado"
    }, status: :not_found
  end

  def endereco_params
    params.require(:endereco).permit(:cep, :rua, :bairro, :cidade, :estado, :numero, :complemento)
  end
end
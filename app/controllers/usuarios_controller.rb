class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all
    render json: {
      status: "success",
      data: @usuarios.as_json(except: :password_digest) # Não expor a senha
    }, status: :ok
  end

  # GET /usuarios/:id
  def show
    render json: {
      status: "success",
      data: @usuario.as_json(except: :password_digest)
    }, status: :ok
  end

  # POST /usuarios
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      render json: {
        status: "success",
        message: "Usuário criado com sucesso!",
        data: @usuario.as_json(except: :password_digest)
      }, status: :created
    else
      render json: {
        status: "error",
        message: "Não foi possível criar o usuário.",
        errors: @usuario.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/:id
  def update
    if @usuario.update(usuario_params)
      render json: {
        status: "success",
        message: "Usuário atualizado com sucesso!",
        data: @usuario.as_json(except: :password_digest)
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível atualizar o usuário.",
        errors: @usuario.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/:id
  def destroy
    if @usuario.destroy
      render json: {
        status: "success",
        message: "Usuário excluído com sucesso!"
      }, status: :ok
    else
      render json: {
        status: "error",
        message: "Não foi possível excluir o usuário."
      }, status: :unprocessable_entity
    end
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      status: "error",
      message: "Usuário não encontrado"
    }, status: :not_found
  end

  def usuario_params
    params.require(:usuario).permit(:nome_usuario, :senha)
  end
end
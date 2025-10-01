class UsuariosController < ApplicationController
  #before_action :set_usuario, only: [:update, :destroy]

  # GET /usuarios
  def index
    @usuarios = Usuario.all
    render json: @usuarios
  end

   def show
    @usuario = Usuario.find(params[:id])
    render json: @usuario
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Usuário não encontrado' }, status: :not_found
  end
  

  # POST /usuarios
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      render json: @usuario, status: :created, location: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /usuarios/:id
  def update
    if @usuario.update(usuario_params)
      render json: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/:id
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    head :no_content   # responde 204 sem corpo
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Usuário não encontrado" }, status: :not_found
  end

  # Apenas permite uma lista de parâmetros confiáveis.
  def usuario_params
    params.require(:usuario).permit(:nome, :email)
  end
end

class UsuariosController < ApplicationController

  before_action :set_entrenador
  before_action :set_entrenador_usuario, only: [:show, :update, :destroy]

  # GET /todos/:todo_id/items
  def index
    json_response(@entrenador.usuarios)
  end

  # GET /todos/:todo_id/items/:id
  def show
    json_response(@usuario)
  end

  # POST /todos/:todo_id/items
  def create
    @entrenador.usuarios.create!(usuario_params)
    json_response(@entrenador, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @usuario.update(usuario_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @usuario.destroy
    head :no_content
  end

  private

  def usuario_params
    params.permit(:nombre, :password)
  end

  def set_entrenador
    @entrenador = Entrenador.find(params[:entrenador_id])
  end

  def set_entrenador_usuario
    @usuario = @entrenador.usuarios.find_by!(id: params[:id]) if @entrenador
  end


end

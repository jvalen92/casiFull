class RutinasController < ApplicationController

  before_action :set_entrenador
  #before_action :set_entrenador_usuario
  before_action :set_entrenador_usuario_rutina, only: [:show, :update, :destroy]

  # GET /entrenadors/:entrenador_id/usuarios/:usuario_id/rutinas
  def index
    json_response(@entrenador.usuarios.find_by(id: params[:usuario_id]).rutinas)
  end

  # GET /entrenadors/:entrenador_id/usuarios/:usuario_id/rutinas/:id
  def show
    json_response(@rutina)
  end

  # POST /todos/:todo_id/items
  def create
    @entrenador.usuarios.find_by(id: params[:usuario_id]).rutinas.create!(rutina_params)
    json_response(@entrenador, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @rutina.update(rutina_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @rutina.destroy
    head :no_content
  end

  private

  def rutina_params
    params.permit(:tipo)
  end

  def set_entrenador
    @entrenador = Entrenador.find(params[:entrenador_id])
  end



  def set_entrenador_usuario
    @usuario= Usuario.find(params [:usuario_id])
  end

  def set_entrenador_usuario_rutina
    @rutina = @entrenador.usuarios.find_by(id: params[:usuario_id]).rutinas.find_by!(id: params[:id])if @entrenador
  end

end

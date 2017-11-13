class EjerciciosController < ApplicationController



  before_action :set_entrenador
  #before_action :set_entrenador_usuario
  before_action :set_entrenador_usuario_rutina_ejercicio, only: [:show, :update, :destroy]

  # GET /entrenadors/:entrenador_id/usuarios/:usuario_id/rutinas
  def index
    json_response(@entrenador.usuarios.find_by(id: params[:usuario_id]).rutinas.find_by(id: params[:rutina_id]).ejercicios)
  end

  # GET /entrenadors/:entrenador_id/usuarios/:usuario_id/rutinas/:id
  def show
    json_response(@ejercicio)
  end

  # POST /todos/:todo_id/items
  def create
    @entrenador.usuarios.find_by(id: params[:usuario_id]).rutinas.find_by(id: params[:rutina_id]).ejercicios.create!(ejercicio_params)
    json_response(@entrenador, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @ejercicio.update(ejercicio_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @ejercicio.destroy
    head :no_content
  end

  private

  def ejercicio_params
    params.permit(:nombre, :musculo, :maquina, :repeticiones, :series, :peso)
  end

  def set_entrenador
    @entrenador = Entrenador.find(params[:entrenador_id])
  end



  def set_entrenador_usuario
    @usuario= Usuario.find(params [:usuario_id])
  end

  def set_entrenador_usuario_rutina_ejercicio
    @ejercicio = @entrenador.usuarios.find_by(id: params[:usuario_id]).rutinas.find_by(id: params[:rutina_id]).ejercicios.find_by!(id: params[:id])if @entrenador
  end


end

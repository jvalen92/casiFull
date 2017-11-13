class EntrenadorsController < ApplicationController
 before_action :set_entrenador, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @entrenadors = Entrenador.all
    json_response(@entrenadors)
  end

  # POST /todos
  def create
    @entrenador = Entrenador.create!(entrenador_params)
    json_response(@entrenador, :created)
  end

  # GET /todos/:id
  def show
    json_response(@entrenador)
  end

  # PUT /todos/:id
  def update
    @entrenador.update(entrenador_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @entrenador.destroy
    head :no_content
  end

  private

  def entrenador_params
    # whitelist params
    params.permit(:nombre, :password)
  end

  def set_entrenador
    @entrenador= Entrenador.find(params[:id])
  end
end

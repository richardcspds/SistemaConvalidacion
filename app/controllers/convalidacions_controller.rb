class ConvalidacionsController < ApplicationController
  before_action :set_convalidacion, only: [:show, :edit, :update, :destroy]

  # GET /convalidacions
  # GET /convalidacions.json
  def index
    @convalidacions = Convalidacion.all
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'convalidacions/convalidacionpdf', pdf: 'Convalidacionpdf' }
    end
  end

  # GET /convalidacions/1
  # GET /convalidacions/1.json
  def show
  end

  # GET /convalidacions/new
  def new
    @universidad = Universidad.all
    @asignaturas = Asignatura.all
    @convalidacion = Convalidacion.new
  end

  # GET /convalidacions/1/edit
  def edit
  end

  # POST /convalidacions
  # POST /convalidacions.json
  def create
    @convalidacion = Convalidacion.new(convalidacion_params)
    @estudiante = Estudiante.new(estudiante_params)

    respond_to do |format|
      if @convalidacion.save
        format.html { redirect_to @convalidacion, notice: 'Convalidacion was successfully created.' }
        format.json { render :show, status: :created, location: @convalidacion }
      else
        format.html { render :new }
        format.json { render json: @convalidacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /convalidacions/1
  # PATCH/PUT /convalidacions/1.json
  def update
    respond_to do |format|
      if @convalidacion.update(convalidacion_params)
        format.html { redirect_to @convalidacion, notice: 'Convalidacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @convalidacion }
      else
        format.html { render :edit }
        format.json { render json: @convalidacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /convalidacions/1
  # DELETE /convalidacions/1.json
  def destroy
    @convalidacion.destroy
    respond_to do |format|
      format.html { redirect_to convalidacions_url, notice: 'Convalidacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convalidacion
      @convalidacion = Convalidacion.find(params[:id])
    end
    def get_asignaturas
      @asignatura = Asignatura.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def convalidacion_params
      params.require(:convalidacion).permit(:convalida, :asignatura_id)
    end
    def set_estudiante
      @estudiante = Estudiante.find(params[:id])
    end
    def estudiante_params
      params.requiere(:estudiante).permit(:nombres, apellidos, matricula)
    end
end

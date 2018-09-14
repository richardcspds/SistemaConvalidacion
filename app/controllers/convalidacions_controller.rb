class ConvalidacionsController < ApplicationController
  before_action :set_convalidacion, only: [:show, :edit, :update, :destroy]

  # GET /convalidacions
  # GET /convalidacions.json
  def index
    @search = Convalidacion.search(params[:q])
    @convalidacions = @search.result
    
  end

  # GET /convalidacions/1
  # GET /convalidacions/1.json
  def show
    respond_to do |format|
      format.html
      format.json
      format.pdf {render template: 'convalidacions/convalidacionpdf', pdf: 'Convalidacionpdf' }
    end
  end

  # GET /convalidacions/new
  def new
    @convalidacion = Convalidacion.new
    @convalidacion.build_estudiante
    @convalidacion.convalidacion_items.new
  end

  # GET /convalidacions/1/edit
  def edit
  end

  # POST /convalidacions
  # POST /convalidacions.json
  def create
    @convalidacion = Convalidacion.new(convalidacion_params)

    # byebug
    respond_to do |format|
      if @convalidacion.save
        @estudiante = @convalidacion.estudiante
        @convalidacion.convalidacion_items.each do |item|
          byebug
          @convalidacion_item = item
        end
        # byebug
        format.html { redirect_to @convalidacion, notice: 'Convalidación creada con éxito.' }
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
        format.html { redirect_to @convalidacion, notice: 'Convalidación actualizada con éxito.' }
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
      format.html { redirect_to convalidacions_url, notice: 'Convalidación eliminada con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convalidacion
      @convalidacion = Convalidacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convalidacion_params
      params.require(:convalidacion).permit(:universidad_home_id, :universidad_procedencia_id, :carrera_home_id, :carrera_procedencia_id, :total_creditos_home, :total_creditos_procedencia, :estudiante_id, estudiante_attributes: [:id, :nombres, :apellidos, :matricula],\
                                            convalidacion_items_attributes: [:id, :convalidacion_id, :asignatura_procedencia_clave, :asignatura_procedencia_nombre,\
                                            :asignatura_procedencia_calificacion, :asignatura_procedencia_creditos, :asignatura_local_clave, :asignatura_local_nombre,\
                                            :asignatura_local_creditos])
    end

end

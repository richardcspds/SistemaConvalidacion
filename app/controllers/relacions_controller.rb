class RelacionsController < ApplicationController
  before_action :set_relacion, only: [:show, :edit, :update, :destroy]

  # GET /relacions
  # GET /relacions.json
  def index
    @relacions = Relacion.all
  end

  # GET /relacions/1
  # GET /relacions/1.json
  def show
  end

  # GET /relacions/new
  def new
    @relacion = Relacion.new
  end

  # GET /relacions/1/edit
  def edit
  end

  # POST /relacions
  # POST /relacions.json
  def create
    @relacion = Relacion.new(relacion_params)

    respond_to do |format|
      if @relacion.save
        format.html { redirect_to @relacion, notice: 'Relacion was successfully created.' }
        format.json { render :show, status: :created, location: @relacion }
      else
        format.html { render :new }
        format.json { render json: @relacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relacions/1
  # PATCH/PUT /relacions/1.json
  def update
    respond_to do |format|
      if @relacion.update(relacion_params)
        format.html { redirect_to @relacion, notice: 'Relacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @relacion }
      else
        format.html { render :edit }
        format.json { render json: @relacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relacions/1
  # DELETE /relacions/1.json
  def destroy
    @relacion.destroy
    respond_to do |format|
      format.html { redirect_to relacions_url, notice: 'Relacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relacion
      @relacion = Relacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relacion_params
      params.require(:relacion).permit(:asignatura_home_id, :asignatura_a_procedencia_id, :asignatura_b_procedencia_id)
    end

    def crear_relacion?
      params[:commit] == 'Crear'
    end
end

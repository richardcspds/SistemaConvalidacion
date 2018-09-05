class ConvalidacionItemsController < ApplicationController
  before_action :set_convalidacion_item, only: [:show, :edit, :update, :destroy]

  # GET /convalidacion_items
  # GET /convalidacion_items.json
  def index
    @convalidacion_items = ConvalidacionItem.all
  end

  # GET /convalidacion_items/1
  # GET /convalidacion_items/1.json
  def show
  end

  # GET /convalidacion_items/new
  def new
    @convalidacion_item = ConvalidacionItem.new
  end

  # GET /convalidacion_items/1/edit
  def edit
  end

  # POST /convalidacion_items
  # POST /convalidacion_items.json
  def create
    @convalidacion_item = ConvalidacionItem.new(convalidacion_item_params)

    respond_to do |format|
      if @convalidacion_item.save
        format.html { redirect_to @convalidacion_item, notice: 'Convalidacion item was successfully created.' }
        format.json { render :show, status: :created, location: @convalidacion_item }
      else
        format.html { render :new }
        format.json { render json: @convalidacion_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /convalidacion_items/1
  # PATCH/PUT /convalidacion_items/1.json
  def update
    respond_to do |format|
      if @convalidacion_item.update(convalidacion_item_params)
        format.html { redirect_to @convalidacion_item, notice: 'Convalidacion item was successfully updated.' }
        format.json { render :show, status: :ok, location: @convalidacion_item }
      else
        format.html { render :edit }
        format.json { render json: @convalidacion_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /convalidacion_items/1
  # DELETE /convalidacion_items/1.json
  def destroy
    @convalidacion_item.destroy
    respond_to do |format|
      format.html { redirect_to convalidacion_items_url, notice: 'Convalidacion item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_convalidacion_item
      @convalidacion_item = ConvalidacionItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def convalidacion_item_params
      params.require(:convalidacion_item).permit(:convalidacions_id, :asignaturas_id, :asignatura_procedencia_clave, :asignatura_procedencia_nombre, :asignatura_procedencia_calificacion, :asignatura_procedencia_creditos, :asignatura_local_clave, :asignatura_local_nombre, :asignatura_local_creditos)
    end
end

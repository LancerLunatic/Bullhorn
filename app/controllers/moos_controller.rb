class MoosController < ApplicationController
  before_action :set_moo, only: [:show, :edit, :update, :destroy]

  # GET /moos
  # GET /moos.json
  def index
    @moos = Moo.all
  end

  # GET /moos/1
  # GET /moos/1.json
  def show
  end

  # GET /moos/new
  def new
    @moo = Moo.new
  end

  # GET /moos/1/edit
  def edit
  end

  # POST /moos
  # POST /moos.json
  def create
    @moo = Moo.new(moo_params)

    respond_to do |format|
      if @moo.save
        format.html { redirect_to @moo, notice: 'Moo was successfully created.' }
        format.json { render :show, status: :created, location: @moo }
      else
        format.html { render :new }
        format.json { render json: @moo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moos/1
  # PATCH/PUT /moos/1.json
  def update
    respond_to do |format|
      if @moo.update(moo_params)
        format.html { redirect_to @moo, notice: 'Moo was successfully updated.' }
        format.json { render :show, status: :ok, location: @moo }
      else
        format.html { render :edit }
        format.json { render json: @moo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moos/1
  # DELETE /moos/1.json
  def destroy
    @moo.destroy
    respond_to do |format|
      format.html { redirect_to moos_url, notice: 'Moo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moo
      @moo = Moo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moo_params
      params.require(:moo).permit(:content)
    end
end

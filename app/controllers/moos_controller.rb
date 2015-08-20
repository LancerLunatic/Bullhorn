class MoosController < ApplicationController
  before_action :set_moo, only: [:show, :edit, :update, :destroy] #before I do any of these actions I must have created a moo
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] #before someone does any of these things they must be signed in
  respond_to :html
  # GET /moos
  # GET /moos.json
  def index
    @moos = Moo.all
  end

  # GET /moos/1
  # GET /moos/1.json
  def show
    respond_with(@moo)
  end

  # GET /moos/new
  def new
    @moo = Moo.new
  end

  # GET /moos/1/edit
  def edit
  end

  def create
    @moo = Moo.new(moo_params)
    @moo.user_id = current_user.id #take whoever the logged in user is and ad his ID to the moo he/she just created
    @moo.save #onoly logged in ppl can create moos
  end

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
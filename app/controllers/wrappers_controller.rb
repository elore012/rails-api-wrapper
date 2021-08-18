class WrappersController < ApplicationController
  before_action :set_wrapper, only: %i[ show edit update destroy ]

  # GET /wrappers or /wrappers.json
  def index
    @wrappers = Wrapper.all
  end

  # GET /wrappers/1 or /wrappers/1.json
  def show
  end

  # GET /wrappers/new
  def new
    @wrapper = Wrapper.new
  end

  # GET /wrappers/1/edit
  def edit
  end

  # POST /wrappers or /wrappers.json
  def create
    @wrapper = Wrapper.new(wrapper_params)

    respond_to do |format|
      if @wrapper.save
        format.html { redirect_to @wrapper, notice: "Wrapper was successfully created." }
        format.json { render :show, status: :created, location: @wrapper }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wrapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wrappers/1 or /wrappers/1.json
  def update
    respond_to do |format|
      if @wrapper.update(wrapper_params)
        format.html { redirect_to @wrapper, notice: "Wrapper was successfully updated." }
        format.json { render :show, status: :ok, location: @wrapper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wrapper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wrappers/1 or /wrappers/1.json
  def destroy
    @wrapper.destroy
    respond_to do |format|
      format.html { redirect_to wrappers_url, notice: "Wrapper was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wrapper
      @wrapper = Wrapper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wrapper_params
      params.fetch(:wrapper, {})
    end
end

class HistoryPointsController < ApplicationController
  before_action :set_history_point, only: [:show, :edit, :update, :destroy]

  # GET /history_points
  # GET /history_points.json
  def index
    @history_points = HistoryPoint.all
  end

  # GET /history_points/1
  # GET /history_points/1.json
  def show
  end

  # GET /history_points/new
  def new
    @history_point = HistoryPoint.new
  end

  # GET /history_points/1/edit
  def edit
  end

  # POST /history_points
  # POST /history_points.json
  def create
    @history_point = HistoryPoint.new(history_point_params)

    respond_to do |format|
      if @history_point.save
        format.html { redirect_to @history_point, notice: 'History point was successfully created.' }
        format.json { render :show, status: :created, location: @history_point }
      else
        format.html { render :new }
        format.json { render json: @history_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /history_points/1
  # PATCH/PUT /history_points/1.json
  def update
    respond_to do |format|
      if @history_point.update(history_point_params)
        format.html { redirect_to @history_point, notice: 'History point was successfully updated.' }
        format.json { render :show, status: :ok, location: @history_point }
      else
        format.html { render :edit }
        format.json { render json: @history_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /history_points/1
  # DELETE /history_points/1.json
  def destroy
    @history_point.destroy
    respond_to do |format|
      format.html { redirect_to history_points_url, notice: 'History point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_point
      @history_point = HistoryPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_point_params
      params.require(:history_point).permit(:user_id, :reserv_id, :used_points)
    end
end

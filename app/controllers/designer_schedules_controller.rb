class DesignerSchedulesController < ApplicationController
  before_action :set_designer_schedule, only: [:show, :edit, :update, :destroy]

  # GET /designer_schedules
  # GET /designer_schedules.json
  def index
    @designer_schedules = DesignerSchedule.all
  end

  # GET /designer_schedules/1
  # GET /designer_schedules/1.json
  def show
  end

  # GET /designer_schedules/new
  def new
    @designer_schedule = DesignerSchedule.new
  end

  # GET /designer_schedules/1/edit
  def edit
  end

  # POST /designer_schedules
  # POST /designer_schedules.json
  def create
    @designer_schedule = DesignerSchedule.new(designer_schedule_params)

    respond_to do |format|
      if @designer_schedule.save
        format.html { redirect_to @designer_schedule, notice: 'Designer schedule was successfully created.' }
        format.json { render :show, status: :created, location: @designer_schedule }
      else
        format.html { render :new }
        format.json { render json: @designer_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /designer_schedules/1
  # PATCH/PUT /designer_schedules/1.json
  def update
    respond_to do |format|
      if @designer_schedule.update(designer_schedule_params)
        format.html { redirect_to @designer_schedule, notice: 'Designer schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @designer_schedule }
      else
        format.html { render :edit }
        format.json { render json: @designer_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designer_schedules/1
  # DELETE /designer_schedules/1.json
  def destroy
    @designer_schedule.destroy
    respond_to do |format|
      format.html { redirect_to designer_schedules_url, notice: 'Designer schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_designer_schedule
      @designer_schedule = DesignerSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def designer_schedule_params
      params.fetch(:designer_schedule, {})
    end
end

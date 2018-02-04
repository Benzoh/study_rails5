class ManagerSchedulesController < ApplicationController
  before_action :set_manager_schedule, only: [:show, :edit, :update, :destroy]

  # GET /manager_schedules
  # GET /manager_schedules.json
  def index
    @manager_schedules = ManagerSchedule.all
  end

  # GET /manager_schedules/1
  # GET /manager_schedules/1.json
  def show
  end

  # GET /manager_schedules/new
  def new
    @manager_schedule = ManagerSchedule.new
  end

  # GET /manager_schedules/1/edit
  def edit
  end

  # POST /manager_schedules
  # POST /manager_schedules.json
  def create
    @manager_schedule = ManagerSchedule.new(manager_schedule_params)

    respond_to do |format|
      if @manager_schedule.save
        format.html { redirect_to @manager_schedule, notice: 'Manager schedule was successfully created.' }
        format.json { render :show, status: :created, location: @manager_schedule }
      else
        format.html { render :new }
        format.json { render json: @manager_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manager_schedules/1
  # PATCH/PUT /manager_schedules/1.json
  def update
    respond_to do |format|
      if @manager_schedule.update(manager_schedule_params)
        format.html { redirect_to @manager_schedule, notice: 'Manager schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager_schedule }
      else
        format.html { render :edit }
        format.json { render json: @manager_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manager_schedules/1
  # DELETE /manager_schedules/1.json
  def destroy
    @manager_schedule.destroy
    respond_to do |format|
      format.html { redirect_to manager_schedules_url, notice: 'Manager schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_schedule
      @manager_schedule = ManagerSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_schedule_params
      params.fetch(:manager_schedule, {})
    end
end

class EditorSchedulesController < ApplicationController
  before_action :set_editor_schedule, only: [:show, :edit, :update, :destroy]

  # GET /editor_schedules
  # GET /editor_schedules.json
  def index
    @editor_schedules = EditorSchedule.all
  end

  # GET /editor_schedules/1
  # GET /editor_schedules/1.json
  def show
  end

  # GET /editor_schedules/new
  def new
    @editor_schedule = EditorSchedule.new
  end

  # GET /editor_schedules/1/edit
  def edit
  end

  # POST /editor_schedules
  # POST /editor_schedules.json
  def create
    @editor_schedule = EditorSchedule.new(editor_schedule_params)

    respond_to do |format|
      if @editor_schedule.save
        format.html { redirect_to @editor_schedule, notice: 'Editor schedule was successfully created.' }
        format.json { render :show, status: :created, location: @editor_schedule }
      else
        format.html { render :new }
        format.json { render json: @editor_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editor_schedules/1
  # PATCH/PUT /editor_schedules/1.json
  def update
    respond_to do |format|
      if @editor_schedule.update(editor_schedule_params)
        format.html { redirect_to @editor_schedule, notice: 'Editor schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @editor_schedule }
      else
        format.html { render :edit }
        format.json { render json: @editor_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editor_schedules/1
  # DELETE /editor_schedules/1.json
  def destroy
    @editor_schedule.destroy
    respond_to do |format|
      format.html { redirect_to editor_schedules_url, notice: 'Editor schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editor_schedule
      @editor_schedule = EditorSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editor_schedule_params
      params.fetch(:editor_schedule, {})
    end
end

class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy, :schedule_new]
  before_action :current_user, only: [:new, :show, :edit, :update, :destroy, :schedule_new]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  def schedule_new
    @schedule.designer_schedules.build
    @schedule.editor_schedules.build
    @schedule.manager_schedules.build
    @schedule.designer_schedules[0].user_id = @user.id
    @schedule.editor_schedules[0].user_id = @user.id
    @schedule.manager_schedules[0].user_id = @user.id
  end

  # GET /schedules/1/edit
  def edit
    @schedule.designer_schedules.build
    @schedule.editor_schedules.build
    @schedule.manager_schedules.build
    # @schedule.designer_schedules[0].user_id = @user.id
    @schedule.designer_schedules.each do |d|
      d.user_id = @user.id
    end
    @schedule.editor_schedules[0].user_id = @user.id
    @schedule.manager_schedules[0].user_id = @user.id
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    session[:user_id] = @schedule.user_id

    select_schedule_record = Schedule.where(date: @schedule.date)
    # raise
    if select_schedule_record.exists? == false
      respond_to do |format|
        if @schedule.save
          format.html { redirect_to '/schedules/schedule_new/' + @schedule.id.to_s, notice: 'Schedule was successfully created.' }
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { render :new }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    else
      # raise
      redirect_to '/schedules/edit/' + select_schedule_record.first.id.to_s
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(
        :date,
        :division_id,
        :user_id,
        designer_schedules_attributes: [
          :id,
          :schedule_id,
          :user_id,
          :content
        ],
        editor_schedules_attributes: [
          :id,
          :schedule_id,
          :user_id,
          :content
        ],
        manager_schedules_attributes: [
          :id,
          :schedule_id,
          :user_id,
          :content
        ],
      )
    end

    def current_user
      if session[:user_id].blank?
        raise
      end
      @user = User.find session[:user_id]
    end
end

class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :update, :destroy, :schedule_new]
  before_action :current_user, only: [:show, :edit, :update, :destroy, :schedule_new, :bulk_edit]
  before_action :authenticate_account!
  before_action :login_user

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    # raise
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  def schedule_new
    @schedule = Schedule.find params[:id]
    @schedule.designer_schedules.build(user_id: @user.id)
    @schedule.editor_schedules.build(user_id: @user.id)
    @schedule.manager_schedules.build(user_id: @user.id)
  end

  # GET /schedules/1/edit
  def edit
    # TODO: 他人のレコードを編集できなくする
    # [ ] 

    # @test = Schedule.with_child_models(@user.id).current_user_records.distinct.find_by(id: params[:schedule_id])
    # raise

    @schedule = Schedule.find params[:schedule_id]
    @schedule.designer_schedules.build(user_id: @user.id)
    @schedule.editor_schedules.build(user_id: @user.id)
    @schedule.manager_schedules.build(user_id: @user.id)
    # raise
  end

  def bulk_edit
    @schedule = Schedule.find params[:schedule_id]
    @schedule.designer_schedules.build(user_id: @user.id)
    @schedule.editor_schedules.build(user_id: @user.id)
    @schedule.manager_schedules.build(user_id: @user.id)
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    _schedule = Schedule.where(date: @schedule.date, division_id: @schedule.division_id)

    session[:user_id] = params[:user][:id]

    if _schedule.exists? == false
      @schedule.save
    else
      @schedule = _schedule.first
    end

    # TODO: 権限 or 編集モードで分岐
    _user = User.find(params[:user][:id])
    if _user.role.slug == 'manager' || _user.role.slug == 'admin'
      redirect_to "/schedules/" << @schedule.id.to_s << "/bulk_edit"
    else
      redirect_to "/schedules/" << @schedule.id.to_s << "/edit/" << _user.id.to_s
      # redirect_to "/schedules/" << @schedule.id.to_s << "/bulk_edit/" << _user.id.to_s
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    if @schedule.changed?
      raise "更新されています"
    end
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
    @@child_schedules = [
      "designer_schedules",
      "editor_schedules",
      "manager_schedules",
    ]

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
          :content,
          :_destroy
        ],
        editor_schedules_attributes: [
          :id,
          :schedule_id,
          :user_id,
          :content,
          :_destroy
        ],
        manager_schedules_attributes: [
          :id,
          :schedule_id,
          :user_id,
          :content,
          :_destroy
        ],
      )
    end

    def current_user
      if session[:user_id].blank?
        raise "ユーザーが選択されていません。"
      end
      @user = User.find session[:user_id]
      Schedule.user_id = @user.id
    end

    def login_user
      @account = current_account
      # @msg = 'you logined at: ' + @account.current_sign_in_at.to_s
    end
end

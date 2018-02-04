require 'test_helper'

class ManagerSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager_schedule = manager_schedules(:one)
  end

  test "should get index" do
    get manager_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_manager_schedule_url
    assert_response :success
  end

  test "should create manager_schedule" do
    assert_difference('ManagerSchedule.count') do
      post manager_schedules_url, params: { manager_schedule: {  } }
    end

    assert_redirected_to manager_schedule_url(ManagerSchedule.last)
  end

  test "should show manager_schedule" do
    get manager_schedule_url(@manager_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_manager_schedule_url(@manager_schedule)
    assert_response :success
  end

  test "should update manager_schedule" do
    patch manager_schedule_url(@manager_schedule), params: { manager_schedule: {  } }
    assert_redirected_to manager_schedule_url(@manager_schedule)
  end

  test "should destroy manager_schedule" do
    assert_difference('ManagerSchedule.count', -1) do
      delete manager_schedule_url(@manager_schedule)
    end

    assert_redirected_to manager_schedules_url
  end
end

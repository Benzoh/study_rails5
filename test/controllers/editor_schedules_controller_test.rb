require 'test_helper'

class EditorSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @editor_schedule = editor_schedules(:one)
  end

  test "should get index" do
    get editor_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_editor_schedule_url
    assert_response :success
  end

  test "should create editor_schedule" do
    assert_difference('EditorSchedule.count') do
      post editor_schedules_url, params: { editor_schedule: {  } }
    end

    assert_redirected_to editor_schedule_url(EditorSchedule.last)
  end

  test "should show editor_schedule" do
    get editor_schedule_url(@editor_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_editor_schedule_url(@editor_schedule)
    assert_response :success
  end

  test "should update editor_schedule" do
    patch editor_schedule_url(@editor_schedule), params: { editor_schedule: {  } }
    assert_redirected_to editor_schedule_url(@editor_schedule)
  end

  test "should destroy editor_schedule" do
    assert_difference('EditorSchedule.count', -1) do
      delete editor_schedule_url(@editor_schedule)
    end

    assert_redirected_to editor_schedules_url
  end
end

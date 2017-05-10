require 'test_helper'

class StudyPathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study_path = study_paths(:one)
  end

  test "should get index" do
    get study_paths_url
    assert_response :success
  end

  test "should get new" do
    get new_study_path_url
    assert_response :success
  end

  test "should create study_path" do
    assert_difference('StudyPath.count') do
      post study_paths_url, params: { study_path: { name: @study_path.name } }
    end

    assert_redirected_to study_path_url(StudyPath.last)
  end

  test "should show study_path" do
    get study_path_url(@study_path)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_path_url(@study_path)
    assert_response :success
  end

  test "should update study_path" do
    patch study_path_url(@study_path), params: { study_path: { name: @study_path.name } }
    assert_redirected_to study_path_url(@study_path)
  end

  test "should destroy study_path" do
    assert_difference('StudyPath.count', -1) do
      delete study_path_url(@study_path)
    end

    assert_redirected_to study_paths_url
  end
end

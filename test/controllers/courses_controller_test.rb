require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post courses_url, params: { course: { assistant: @course.assistant, code: @course.code, condition: @course.condition, description: @course.description, ects: @course.ects, erasmus_students: @course.erasmus_students, exam_date: @course.exam_date, exam_duration: @course.exam_duration, exam_language: @course.exam_language, exam_session: @course.exam_session, examination_regulation: @course.examination_regulation, free_auditor: @course.free_auditor, frequency: @course.frequency, goals: @course.goals, hours_per_week: @course.hours_per_week, language: @course.language, lecturer: @course.lecturer, level: @course.level, name: @course.name, name_english: @course.name_english, number_of_students: @course.number_of_students, references: @course.references, semester: @course.semester, softskill_students: @course.softskill_students, study_program: @course.study_program, time_schedule: @course.time_schedule, type_of_evaluation: @course.type_of_evaluation } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { assistant: @course.assistant, code: @course.code, condition: @course.condition, description: @course.description, ects: @course.ects, erasmus_students: @course.erasmus_students, exam_date: @course.exam_date, exam_duration: @course.exam_duration, exam_language: @course.exam_language, exam_session: @course.exam_session, examination_regulation: @course.examination_regulation, free_auditor: @course.free_auditor, frequency: @course.frequency, goals: @course.goals, hours_per_week: @course.hours_per_week, language: @course.language, lecturer: @course.lecturer, level: @course.level, name: @course.name, name_english: @course.name_english, number_of_students: @course.number_of_students, references: @course.references, semester: @course.semester, softskill_students: @course.softskill_students, study_program: @course.study_program, time_schedule: @course.time_schedule, type_of_evaluation: @course.type_of_evaluation } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end

require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "not logged in user should get redirected from pages" do
    session.delete(:user_id)
    get :index
    assert_response :redirect
    assert_redirected_to root_path
  end

  test "Logged in user can see exactly her tasks that belong to her" do
     session[:user_id] = users(:grace).id #this is the active record ID, not the github one. This is whitebox testing
    get :index
    assert_response :success
    assert_template "tasks/index" #(or :index)


    tasks_from_controller = assigns(:tasks)
    assert_equal tasks_from_controller.length, users(:grace).tasks.length

     tasks_from_controller.each do |task|
      assert_includes users(:grace).tasks, task #checks that each task is included in the collective tasks for grace
   end
  end
end

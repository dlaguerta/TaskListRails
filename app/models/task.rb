class Task < ActiveRecord::Base

  def task_status
    if completion_status == true
      @valid = "complete"
      "Current Task Status: #{@valid}"
    else
      @valid = "incomplete"
      "Current Task Status: #{@valid}"
    end
  end
end

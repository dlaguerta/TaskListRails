class Task < ActiveRecord::Base

  def task_status
    if completion_status == true
      "Current Task Status: Complete"
    else
      completion_date = nil
      "Current Task Status: Incomplete"
    end
  end
end

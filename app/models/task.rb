class Task < ActiveRecord::Base
  belongs_to :user
  def task_status
    if completion_status == true
      "Current Task Status: Complete"
    else
      "Current Task Status: Incomplete"
    end
  end
end

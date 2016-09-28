class TasksController < ApplicationController
  def index
    @list_of_tasks = [
      { id: 1,
        name:  "finish homework",
        description: "do the homework!",
        completion_status: "not there yet",
        completion_date: "not there yet"
      },
      { id: 2,
        name: "drink beer",
        description: "get a lot of beer and drink it",
        completion_status: "not there yet",
        completion_date: "not there yet"
      },
      { id: 3,
        name: "feed foot foot",
        description: "give the cat lots of food food",
        completion_status: "not there yet",
        completion_date: "not there yet"
      },
      { id: 4,
        name: "deal with the litter box",
        description: "get that poop out of there",
        completion_status: "not there yet",
        completion_date: "not there yet"
      }
    ]

    # @list_of_tasks = {
    #   # name, description, completion status, and completion date.
    #   name: params[:name],
    #   description: params[:description],
    #   completion_status: params[:completion_status],
    #   completion_date: params[:completion_date]
    # }

  end

  def show
    @list_of_tasks = [
      { id: 1,
        name:  "finish homework",
        description: "do the homework!",
        completion_status: "not there yet",
        completion_date: "not there yet"
      },
      { id: 2,
        name: "drink beer",
        description: "get a lot of beer and drink it",
        completion_status: "not there yet",
        completion_date: "not there yet"
      },
      { id: 3,
        name: "feed foot foot",
        description: "give the cat lots of food food",
        completion_status: "not there yet",
        completion_date: "not there yet"
      },
      { id: 4,
        name: "deal with the litter box",
        description: "get that poop out of there",
        completion_status: "not there yet",
        completion_date: "not there yet"
      }
    ]

    puts "This is the id: #{params[:id]}"
        @task_id = params[:id].to_i - 1

  end
end

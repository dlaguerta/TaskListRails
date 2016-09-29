class TasksController < ApplicationController
  def index
     @list_of_tasks = Task.all
    # @list_of_tasks = [
    #   { id: 1,
    #     name:  "finish homework",
    #     description: "do the homework!",
    #     completion_status: "not there yet",
    #     completion_date: "not there yet"
    #   },
    #   { id: 2,
    #     name: "drink beer",
    #     description: "get a lot of beer and drink it",
    #     completion_status: "not there yet",
    #     completion_date: "not there yet"
    #   },
    #   { id: 3,
    #     name: "feed foot foot",
    #     description: "give the cat lots of food food",
    #     completion_status: "not there yet",
    #     completion_date: "not there yet"
    #   },
    #   { id: 4,
    #     name: "deal with the litter box",
    #     description: "get that poop out of there",
    #     completion_status: "not there yet",
    #     completion_date: "not there yet"
    #   }
    # ]

    # @list_of_tasks = {
    #   # name, description, completion status, and completion date.
    #   name: params[:name],
    #   description: params[:description],
    #   completion_status: params[:completion_status],
    #   completion_date: params[:completion_date]
    # }

  end

  def show
     @single_task = Task.find(params[:id])
    # @list_of_tasks = [
    #   { id: 1,
    #     name:  "finish homework",
    #     description: "do the homework!",
    #     completion_status: "not there yet",
    #     completion_date: "not there yet"
    #   },
    #   { id: 2,
    #     name: "drink beer",
    #     description: "get a lot of beer and drink it",
    #     completion_status: "not there yet",
    #     completion_date: "not there yet"
    #   },
    #   { id: 3,
    #     name: "feed foot foot",
    #     description: "give the cat lots of food food",
    #     completion_status: "not there yet",
    #     completion_date: "not there yet"
    #   },
    #   { id: 4,
    #     name: "deal with the litter box",
    #     description: "get that poop out of there",
    #     completion_status: "not there yet",
    #     completion_date: "not there yet"
    #   }
    # ]

    puts "This is the id: #{params[:id]}"
        @task_id = params[:id].to_i - 1
  end

  def new
  end

  def create
    redirect_to tasks_path
  end
  # puts "HERE IS YOUR NEW TASK #{ params }"
  # #HERE IS WHERE WE WILL SAVE IT TO THE DATABASE
  #
  # new_task = {
  #   name: params[:name],
  #   description: params[:description]
  # }
 #this entries path corresponds to a the entries route and starts a new process

end

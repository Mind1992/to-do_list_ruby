require './lib/task'
require './lib/list'
@lists = []
@list = []

def main_menu
  loop do
    puts "Press 'al' to add a new list or 'll' to list all of your lists."
    puts "Press 'a' to add a task or 'l' to list all of your tasks."
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_task
    elsif main_choice == 'l'
      list_tasks
    elsif main_choice == 'll'
      list_lists
    elsif main_choice == 'al'
      add_list
    elsif main_choice == 'x'
      puts "Good-bye!"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  @list.each do |task|
    if task.status == false
      puts task.description
    end
  end
  puts
  puts "To select a task from the list type the number of the task"
  selected_task = gets.chomp.to_i
  @task = @list[selected_task - 1]

  p "The currently selected task is #{@task.description}."
  puts "To mark it as complete and remove it, press 'c'"
  puts "To move this task to a list press 'mv'"
  list_option = gets.chomp
  if list_option == 'c'
      @list[selected_task-1].mark_complete
  elsif list_option == 'mv'
        add_task_to_list
  else
    puts "Sorry, that wasn't a valid option."
    list_tasks
  end
end

def add_list
  puts "Name the new list:\n"
  user_input = gets.chomp
  @lists << List.new(user_input)
  puts "List added.\n\n"
end

def list_lists
  puts "Here are all of your lists:"
  @lists.each do |list|
    p list.name
  end
end

def add_task_to_list
  puts "Select a list you want to move your task in."
  @lists.each do |list|
    p list.name
  end
  puts "To select a list, type the number of the list"
  selected_list = gets.chomp.to_i
  list = @lists[selected_list - 1]
  p "The currently selected list is #{list.name}."
  list.add_task(@task)
  puts "**#{@task.description}** added to the list **#{list.name}**"
end




main_menu

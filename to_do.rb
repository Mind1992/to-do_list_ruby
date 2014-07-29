require './lib/task'
require './lib/list'

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
  Task.new(user_description).save
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  Task.all.each do |task|
    if task.status == false
      puts task.description
    end
  end
  puts
  puts "To select a task from the list type the number of the task"
  selected_task = gets.chomp.to_i
  @task = Task.all[selected_task - 1]
  p "The currently selected task is **#{@task.description}**."
  puts "To mark **#{@task.description}** as complete and remove it, press 'c'"
  puts "To move **#{@task.description}** to a list press 'mv'"
  puts "To scale priority for **#{@task.description}**, press 'sp'"
  puts "To scale due date for **#{@task.description}**, press 'sd'"
  list_option = gets.chomp
  if list_option == 'c'
      complete_task
  elsif list_option == 'mv'
        add_task_to_list
  elsif list_option == 'sp'
    scale_due_date
  elsif list_option == 'sd'
    scale_priority
  else
    puts "Sorry, that wasn't a valid option."
    list_tasks
  end
end

def complete_task
  Task.all[selected_task-1].mark_complete
end

def add_list
  puts "Name the new list:\n"
  user_input = gets.chomp
  List.new(user_input).save
  puts "List added.\n\n"
end

def list_lists
  puts "Here are all of your lists:"
  List.all.each do |list|
    p list.name
  end
end

def add_task_to_list
  puts "Select a list you want to move your task in."
  List.all.each do |list|
    p list.name
  end
  puts "To select a list, type the number of the list"
  selected_list = gets.chomp.to_i
  list = List.all[selected_list - 1]
  p "The currently selected list is #{list.name}."
  list.add_task(@task)
  puts "**#{@task.description}** added to the list **#{list.name}**"
end

def scale_due_date
  puts "Scale due date from 1 to 5 for **#{@task.description}**: "
  user_input = gets.chomp.to_i
  @task.scale_due_date(user_input)
  puts "You just scaled **#{@task.description}** to #{@task.due_date}"
end

def scale_priority
  puts "Scale priority from 1 to 5 for **#{@task.description}**: "
  user_input = gets.chomp.to_i
  @task.scale_priority(user_input)
  puts "You just scaled **#{@task.description}** to #{@task.pri}"
end



main_menu

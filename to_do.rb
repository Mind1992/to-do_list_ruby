require './lib/task'

@list = []

def main_menu
  loop do
    puts "Press 'a' to add a task or 'l' to list all of your tasks."
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_task
    elsif main_choice == 'l'
      list_tasks
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
  puts "\n"
  puts "To select a task from the list type the number of the task"
  selected_task = gets.chomp.to_i
  task_text = @list[selected_task - 1].description

  p "The currently selected item is #{task_text}."
  puts "To mark it as complete and remove it, press 'c'"
  list_option = gets.chomp
  if list_option == 'c'
      @list[selected_task-1].mark_complete
  else
    puts "Sorry, that wasn't a valid option."
  end
  # puts "To mark an task complete and remove it from the list, press 'c'"
  # list_change = gets.chomp
  # if list_change == 'c'
end




main_menu

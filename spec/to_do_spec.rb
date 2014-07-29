require 'rspec'
require 'task'
require 'list'

describe Task do
  before do
    # Task.clear
  end

  it 'is initialized with a description' do
    test_task = Task.new('scrub the zebra')
    test_task.should be_an_instance_of Task
  end

  it 'lets you read the description out' do
    test_task = Task.new('scrub the zebra')
    test_task.description.should eq 'scrub the zebra'
  end

  it 'lets you mark a task as completed' do
    test_task = Task.new('scrub the zebra')
    test_task.mark_complete.should eq true
  end

  it 'sets due date and priority to 0' do
    test_task = Task.new('scrub the zebra')
    test_task.due_date.should eq 0
    test_task.priority.should eq 0
  end

  it 'lets you scale the due date and priority (on a scale of 1-5)' do
    test_task = Task.new('scrub the zebra')
    test_task.scale_due_date(5)
    test_task.scale_priority(5)
    test_task.due_date.should eq 5
    test_task.priority.should eq 5
  end

  describe '.all' do
    it 'is empty at first' do
      Task.all.should eq []
    end

    it 'gets added to when save is called on an instance' do
       test_task = Task.new('scrub the zebra')
       test_task.save
       Task.all.should eq [test_task]
     end
  end

  describe '.clear' do
    it 'empties out all the saved tasks' do
      Task.new('scrub the zebra').save
      Task.clear
      Task.all.should eq []
    end
  end
end


  describe List do
    it 'starts out with an empty list of tasks' do
      test_list = List.new("School stuff")
      test_list.tasks.should eq []
    end

    it "can add tasks" do
      test_list = List.new("School stuff")
      test_task = Task.new("Learn Ruby")
      test_list.add_task(test_task)
      test_list.tasks.should eq [test_task]
    end

  describe '.all' do
    it 'is empty at first' do
      List.all.should eq []
    end

    it 'gets added to when save is called on an instance' do
      test_list = List.new("Grocery")
      test_list.save
      List.all.should eq [test_list]
    end
  end

  describe '.clear' do
    it 'empties out all the saved lists' do
      List.new('Learn ruby').save
      List.clear
      List.all.should eq []
    end
  end

  describe '.sort_by_name' do
    it 'sorts tasks within a list by name' do
      list = List.new('Epicodus')
      list.save
      task1 = Task.new("Learn Ruby")
      task2 = Task.new("Build Ruby")
      list.add_task(task1)
      list.add_task(task2)
      list.sort_by_name.should eq [task2, task1]
    end
  end

  describe '.sort_by_date' do
    it 'sorts tasks within a list by date' do
      list = List.new('Epicodus')
      list.save
      task1 = Task.new("Learn Ruby")
      task2 = Task.new("Learn Rails")

      task1.scale_due_date(5)
      task2.scale_due_date(3)
      list.add_task(task1)
      list.add_task(task2)
      list.sort_by_date.should eq [task2, task1]
      end
    end
end

require 'rspec'
require 'task'
require 'list'

describe Task do
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
end

require 'spec_helper'

describe Task do
  it 'is initialized with a name and a task ID' do
    task = Task.new({'name' => 'learn SQL', 'list_id' =>1})
    task.should be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new({'name' => 'learn SQL', 'list_id' =>1})
    task.name.should eq 'learn SQL'
  end

  it 'tells you its list ID' do
    task = Task.new({'name' => 'learn SQL', 'list_id' =>1})
    task.list_id.should eq 1
  end

  it 'starts with no tasks' do
    Task.all.should eq []
  end

  it 'lets you save multiple tasks to the database' do
    task = Task.new({'name' => 'learn SQL', 'list_id' =>1})
    task.save
    task_two = Task.new({'name' => 'learn math', 'list_id' =>1})
    task_two.save
    Task.all.should eq [task, task_two]
  end

  it 'lets you remove a task from the database' do
    task = Task.new({'name' => 'teddy bear', 'list_id' =>1})
    task.save
    task_two = Task.new({'name' => 'air soft gun', 'list_id' =>1})
    task_two.save
    task.remove
    Task.all.should eq [task_two]
  end

  it 'is the same task if it has the same name and list id' do
    task1 = Task.new({'name' => 'learn SQL', 'list_id' =>1})
    task2 = Task.new({'name' => 'learn SQL', 'list_id' =>1})
    task1.should eq task2
  end
end

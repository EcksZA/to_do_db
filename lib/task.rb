require 'pg'

class Task
  attr_reader :name, :list_id

  def initialize(hash)
    @name = hash['name']
    @list_id = hash['list_id']
  end

  def save
    DB.exec("INSERT INTO tasks (name, list_id) VALUES ('#{@name}', #{@list_id});")
  end

  def remove
    DB.exec("DELETE FROM tasks WHERE name = '#{@name}'")
  end

  def self.all
    results = DB.exec("SELECT * FROM tasks;")
    tasks = []
    results.each do |result|
      name = result['name']
      list_id = result['list_id'].to_i
      tasks << Task.new({'name' => name , 'list_id' => list_id})
    end
    tasks
  end

  def ==(another_name)
    self.name == another_name.name && self.list_id == another_name.list_id
  end
end

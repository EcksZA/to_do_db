class List

  attr_reader :name, :id

  def initialize(name)
    @name = name
  end

  def ==(another_name)
    self.name == another_name.name
  end

  def self.all
    results = DB.exec('SELECT * FROM lists;')
    lists = []
    results.each do |result|
      name = result['name']
      lists << List.new(name)
    end
  lists
  end

  def save
    results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end
end

require 'sqlite3'
require 'singleton'

class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('question.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :fname, :lname, :id

  def self.all
    data = QuestionDBConnection.instance.execute('SELECT * FROM users')
    data.map {|datum| User.new(datum)}
  end

  def self.find_by_name(name)
    user = QuestionDBConnection.instance.execute(<<-SQL, name)
    SELECT * 
    FROM users
    WHERE name = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def create
    raise "#{self} already exist in database" if @id
    user = QuestionDBConnection.instance.execute(<<-SQL, @fname, @lname)
    INSERT INTO
    users (fname, lname)
    VALUES
    (?, ?)
    SQL
    @id = QuestionDBConnection.instance.last_insert_row_id
  end
  
  def update()
    raise "#{self} already exist in database" if @id
    QuestionDBConnection.instance.execute(<<-SQL, @fname, @lname, @id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end
end
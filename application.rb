#!/usr/bin/ruby

require "rubygems"
require "mysql2"

class Application

  def initialize
    @db_connection = Mysql2::Client.new(:host => "localhost", :username => "ubuntu")
    @team_table = "Table"
    @superhero_table = "Superhero"
    @HasPower_relation = "HasPower"
    @db_connection.query("USE SuperheroDatabase")
  end

  def get_secret_identity_from_name(name)
     query="SELECT * FROM " + @superhero_table + " WHERE name=\"" + name + "\";"
     print query + "\n"
     results = @db_connection.query(query)
     read_rows("secret_identity", results)
  end

  def read_rows(attr, results)
     print "Reading Results: \n"
     results.each do |row|
         if !row[attr].nil?
           print row[attr] + "\n"
         end
     end
  end
end

 app = Application.new
 app.get_secret_identity_from_name("Iron Man")

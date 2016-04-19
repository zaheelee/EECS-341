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

  def start
    @on = true
    puts "\nSelect an option:"
    puts "1. Get secrete identity from name"
    puts "quit"
    choice = gets.chomp 
    task_router(choice)
    if @on 
       start
    end
  end

  def task_router(n)
    case n
      when "1"
        puts "Enter a superhero name: " 
        name = gets.chomp
        get_secret_identity_from_name(name)
      when "quit"
        @on = false
      else 
        puts "invalid choice, try again, bro."
    end
  end

  def get_secret_identity_from_name(name)
     query="SELECT * FROM " + @superhero_table + " WHERE name=\"" + name + "\";"
     results = @db_connection.query(query)
     read_rows("secret_identity", results)
  end

  def read_rows(attr, results)
     print "\nResults: \n"
     results.each do |row|
         if !row[attr].nil?
           print row[attr] + "\n"
         end
     end
  end
end

 app = Application.new
 app.start

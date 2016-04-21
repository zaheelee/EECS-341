#!/usr/bin/ruby

require "rubygems"
require "mysql2"

class Application

  def initialize
    @db_connection = Mysql2::Client.new(:host => "localhost", :username => "ubuntu")
    @team_table = "Table"
    @superhero_table = "Superhero"
    @HasPower_relation = "HasPower"
    @archenemy_table = "Archenemies"
    @appears_in_table = "AppearsIn"
    @movie_table = "Movie"
    @db_connection.query("USE SuperheroDatabase")
  end

  def start
    @on = true
    puts "\n======= Select an option: ======="
    puts "1. Get secret identity from name"
    puts "2. Get name from secret identity"
    puts "3. Get team from name"
    puts "4. Get Archenenemy from name"
    puts "5. Get Movie from name"
    puts "6. Quit\n\n"
    choice = gets.chomp 
    puts "\n"
    task_router(choice)
    if @on 
       start
    else
       @db_connection.close
    end
  end

  def task_router(n)
    case n
      when "1"
        puts "\nEnter a superhero name: " 
        name = gets.chomp
        get_secret_identity_from_name(name)
      when "2"
        puts "Enter a secret identity: " 
        name = gets.chomp
        get_name_from_secret_identity(name)
      when "3"
        puts "Enter a superhero name: " 
        name = gets.chomp
        get_team_from_name(name)
      when "4"
        puts "Enter a superhero name: " 
        name = gets.chomp
        get_archenemy_from_name(name)
      when "5"
        puts "Enter a superhero name: " 
        name = gets.chomp
        get_movie_from_name(name)
      when "6"
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

  def get_name_from_secret_identity(name)
     query="SELECT * FROM " + @superhero_table + " WHERE secret_identity=\"" + name + "\";"
     results = @db_connection.query(query)
     read_rows("name", results)
  end
 
  def get_team_from_name(name)
     query="SELECT * FROM " + @superhero_table + " WHERE name=\"" + name + "\";"
     results = @db_connection.query(query)
     read_rows("team_name", results)
  end
  
  def get_archenemy_from_name(name)
     query="SELECT * FROM " + @archenemy_table + " WHERE hero_name=\"" + name + "\";"
     results = @db_connection.query(query)
     read_rows("villain_name", results)
  end

  def get_movie_from_name(name)
     query = "SELECT * FROM " + @appears_in_table + " WHERE character_name=\"" + name + "\";"
     results = @db_connection.query(query)
     read_rows("movie_name", results)
  end

  def read_rows(attr, results)
     print "\n  Results: \n"
     results.each do |row|
         if !row[attr].nil?
           print "    " + row[attr] + "\n"
           sleep(0.2)
         end
     end
     sleep(1)
  end
end

 app = Application.new
 app.start

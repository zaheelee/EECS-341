#!/usr/bin/ruby

require 'mysql'

class Application
  attr_accessor :db_connection, :user_table, :message_table

  def initialize
    @db_connection = Mysql.new 'localhost', 'ubuntu'
    @database = "SuperheroDatabase"
    @team_table = "Table"
      @tt_name = 0
      @tt_city = 1
      @tt_universe = 3
    @superhero_table = "Superhero"
      @st_name = 0
      @st_secret_identity=1
      @st_universe=2
      @st_city=3
      @st_sidekick=4
      @st_team_name=5
      @st_origin_year=6
      @st_weakeness==7
      @isALive=8
      @isEvil=
    @HasPower_relation = "HasPower"
      @pr_power_name=0
      @pr_name=1
    @db_connection.query("USE UserProfiles")
  end

  def get_secret_identity_from_name(name)
     query="SELECT * FROM " + @superhero_table + " WHERE name=\"" + name + "\";"
     results = @db_connection.query(query)
     row = results.fetch_row
     row[@secret_identity]
  end
end

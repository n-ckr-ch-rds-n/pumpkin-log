require 'pg'

class PumpLog

  def initialize
    @database = PG.connect(dbname: 'pumpkins')
  end

  def new_entry(category, winner, year)
    @database.exec("INSERT INTO pumpkins (class, winner, year) VALUES ('#{category}', '#{winner}', '#{year}')")
  end

  def view_table
    pumpkindata = @database.exec("SELECT * FROM pumpkins")
    pumpkindata.each { |entry| puts "ID: #{entry['id']}, Class: #{entry['class']}, Winner: #{entry['winner']}, Year: #{entry['year']}"}
  end

  def delete_entry(id)
    @database.exec("DELETE FROM pumpkins WHERE id = '#{id}'")
  end

end

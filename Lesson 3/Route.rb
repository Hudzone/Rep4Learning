class Route

  @@full_path = []

  def initialize(start_station, last_station)
    @@full_path << start_station
    @@full_path << last_station
  end

  def add_station(name)
    @@full_path.insert(-2, name)
    puts "Station #{name} added succesfully"
  end

  def delete_station(name)
    @@full_path.delete(name)
    puts "Station #{name} deleted succesfully"
  end

  def station_list
    @@full_path.each do |station|
      print station + ", "
    end 
  end
end
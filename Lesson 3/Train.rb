class Train
  attr_reader :number, :type, :wagons
  attr_accessor :speed, :route

  def initialize(number, type, wagons)
    @number = number
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def gain_speed(speed)
    @speed = speed
  end

  def current_speed
    @speed
  end

  def brake
    @speed = 0
  end

  def quantity
    @wagons
  end

  def attach_the_wagon
    @wagons += 1 if @speed.zero?
  end

  def unhook_the_wagon
    @wagons -= 1 if @speed.zero?
  end

  def assign_a_route(route)
    @route = route
    @current_station = $start_station
    puts "Your current route is #{@route}. You're at the start station - #{@current_station}"
  end

  def go_next
    next_id = $full_path.index(@current_station) + 1 if @current_station != $last_station
    next_station = $full_path[next_id]
    @current_station = next_station
    puts "Current station is #{@current_station}"
  end

  def go_back
    back_id = $full_path.index(@current_station) - 1 if @current_station != $start_station
    previous_station = $full_path[back_id]
    @current_station = previous_station
    puts "Current station is #{@current_station}"
  end


  def current_station
    @current_station
  end

  def previous_station
    back_id = $full_path.index(@current_station) - 1
    previous_station = $full_path[back_id]
    puts previous_station
  end

  def next_station
    next_id = $full_path.index(@current_station) + 1
    next_station = $full_path[next_id]
    puts next_station
  end
end

class Route

  $full_path = []

  def initialize(start_station, last_station)
    $start_station = start_station
    $last_station = last_station
    $full_path << start_station
    $full_path << last_station
  end

  def add_station(name)
    $full_path.insert(-2, name)
    puts "Station #{name} added succesfully"
  end

  def delete_station(name)
    $full_path.delete(name)
    puts "Station #{name} deleted succesfully"
  end

  def station_list
    $full_path.each do |station|
      print station + ", "
    end 
  end
end
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
    @route.full_path[0].train_arrives(self)
    @current_station_id = 0
  end

  def go_next
    return unless next_station

    current_station.train_departure(self)
    next_station.train_arrives(self)
    @current_station_id += 1
  end

  def go_back
    return unless previous_station

    current_station.train_departure(self)
    previous_station.train_arrives(self)
    @current_station_id -= 1
  end


  def choosen_route
    @route.full_path[@current_station_id]
  end

  def previous_station
    @route.full_path[@current_station_id - 1] if @current_station_id != 0
  end

  def next_station
    @route.full_path[@current_station_id + 1] if @current_station_id != -1
  end
end
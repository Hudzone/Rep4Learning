class Train
  attr_reader :number, :wagons
  attr_accessor :speed, :route

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
  end

  def gain_speed(speed)
    @speed = speed
  end

  def brake
    @speed = 0
  end

  def attach_the_wagon(wagon)
    @wagons << wagon if @speed.zero? && train_type == wagon.wagon_type
  end

  def unhook_the_wagon(wagon)
    @wagons.delete(wagon) if @speed.zero? && train_type == wagon.wagon_type
  end

  def assign_a_route(route)
    @route = route
    @current_station = @route.full_path[0]
    puts "Current station is #{@current_station}"
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

  protected

  #это внутренняя информация класса

  def current_speed
    @speed
  end

  def wagon_list
    @wagons
  end
end
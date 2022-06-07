#frozen_string_literal: true

require_relative 'Station.rb'
require_relative 'Route.rb'
require_relative 'Train.rb'
require_relative 'CargoTrain.rb'
require_relative 'PassengerTrain.rb'
require_relative 'CargoWagon.rb'
require_relative 'PassengerWagon.rb'

main_menu = [
{ number: 1, title: "Create New Station", method: :create_station},
{ number: 2, title: "Create New Train", method: :create_train},
{ number: 3, title: "Create New Wagon", method: :create_a_wagon},
{ number: 4, title: "Route Manager", method: :route_manager},
{ number: 5, title: "Assign The Route", method: :setup_a_route},
{ number: 6, title: "Attach The Wagon", method: :attach_a_wagon},
{ number: 7, title: "Unhook The Wagon", method: :unhook_a_wagon},
{ number: 8, title: "Train Management", method: :rule_the_train},
{ number: 9, title: "Show Station List", method: :station_list},
{ number: 10, title: "Show Train List" , method: :train_list }
].freeze

def create_station
  puts "Enter Name of the Object: "
  station_class = gets.strip
  
  puts "Enter Station Title: "
  station = gets.strip.capitalize

  puts "Station #{station} created"
  station_class = Station.new(station)
end

def create_train
  puts "Let's Create Train. Please enter the name of the Object!"
    train_class = gets.strip
    puts "Enter title train number: "
    train = gets.strip.capitalize
    puts "What type of the train? (Passenger or Cargo)"
    train_type = gets.strip

      if train_type == "Passenger"
        puts "Train created. Title: #{train} Type: #{train_type}"

        train_class = PassengerTrain.new(train)
      elsif train_type == "Cargo"
        puts "Train created. Title: #{train} Type: #{train_type}"

        train_class = CargoTrain.new(train)
      end
end

def create_a_wagon
  puts "Let's Create the Wagon. Please enter the name of the Object!"
    wagon_class = gets.strip
    puts "What type of the Wagon? (Passenger or Cargo)"
    wagon_type = gets.strip

      if wagon_type == "Passenger"
        puts "Wagon created. Type: #{wagon_type}"

        wagon_class = PassengerWagon.new

      elsif wagon_type == "Cargo"
        puts "Wagon created. Type: #{wagon_type}"

        wagon_class = CargoWagon.new
      end
end

def route_manager
  puts "========================="
  puts "Welcome to Route Manager."
  puts "========================="
  puts "If you want to create route type 'create'"
  puts "If you want to manage the route type 'manage'"
  choice = gets.chomp.to_sym

  case choice
  when :create
    puts "Enter the name of object : "
    route_object = gets.strip
    puts "Enter the first station of route: "
    first_station = gets.strip.capitalize
    puts "Enter the last station of route: "
    last_station = gets.strip.capitalize
      
    route_object = Route.new(first_station, last_station)

    puts route_object.full_path
      

    when :manage
      puts "What do you want to do? (add or delete)"
      sub_choice = gets.chomp.to_sym

     case sub_choice
     when :add
      puts "Enter name of route: "
      route_class = gets.strip
      puts "Enter the name of station: "
      stat_name = gets.strip.capitalize

      route_class.add_station(stat_name)
     when :delete
      puts "Enter name of route class: "
      route_class = gets.strip
      puts "Enter the name of station: "
      stat_name = gets.strip.capitalize

      route_class.delete_station(stat_name)
     end
  end
end

def setup_a_route
  puts "Enter the route: "
  route = gets.chomp
  puts "Enter the train object name: "
  train = gets.strip

  train.assign_a_route(route)
end

def attach_a_wagon
  puts "Enter train's title: "
  train_class_title = gets.strip

  puts "Enter type of wagon: "
  wagon_class_type = gets.strip

  train_class_title.attach_a_wagon(wagon_class_type)

  puts "Please, stop the train!" unless speed.zero?
  puts "This type of wagon can not be attached" unless train_class_title.train_type == wagon_class_type.wagon_type
end

def unhook_a_wagon
  puts "Enter train's title: "
  train_class_title = gets.strip

  puts "Enter type of wagon: "
  wagon_class_type = gets.strip

  train_class_title.unhook_a_wagon(wagon_class_type)

  puts "Please, stop the train!" unless speed.zero?
  puts "This type of wagon can not be attached" unless train_class_title.train_type == wagon_class_type.wagon_type
end

def rule_the_train
  puts "What do you want to do (move or return)"
  choice = gets.chomp.to_sym

  case choice
  when :move
    puts "Enter class name of train: "
    train_class = gets.strip

    train_class.go_next

  when :return
    puts "Enter class name of train: "
    train_class = gets.strip

    train_class.go_back
  end
end

def station_list
  puts "Enter name of route class: "
  route_class = gets.chomp

  route_class.station_list
end

def train_list
   puts "Enter name of station class: "
  station_class = gets.chomp

  station_class.trains_at_station
end

loop do
  puts "What do you want to do? (type number)"
  main_menu.each { |item| puts "#{item[:number]}: #{item[:title]}" }
  choice = gets.strip.to_i
  choosen_item = main_menu.find { |choosen_title| choosen_title[:number] == choice }
  send(choosen_item[:method])
  puts "Type anything to continue or close to stop operation"
  break if gets.strip.to_sym == :close
end

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

  #protected

  #это внутренняя информация класса

  def current_speed
    @speed
  end

  def wagon_list
    @wagons
  end
end
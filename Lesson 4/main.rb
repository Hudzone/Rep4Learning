require_relative "Station.rb"
require_relative "Route.rb"
require_relative "Train.rb"
require_relative "CargoTrain.rb"
require_relative "PassengerTrain.rb"
require_relative "CargoWagon.rb"
require_relative "PassengerWagon.rb"

def menu
  puts "========================="
  puts "User Interface v.1.0.0"
  puts "========================="
  puts "1. Create Station"
  puts "2. Create Train"
  puts "3. Enter Route Manager"
  puts "4. Assign a Route"
  puts "5. Attach a Wagon"
  puts "6. Unhook a Wagon"
  puts "7. Rule The Train"
  puts "8. Station List"
  puts "9. Trains At Station"
  puts
  puts "TYPE 0 TO CLOSE THE PROGRAM"
  print "Type number of menu item : "
end

loop do
  puts menu
  menu = gets.to_i

  if menu.negative? || menu > 9 || menu.nil?
    puts "Incorrect choice. Try Again."
    exit
  end


  if menu == 1
    puts "Enter Name of the Object: "
    $station_class = gets.strip

    puts "Enter Station Title: "
    station = gets.strip.capitalize

    puts "Station #{station} created"

    $station_class = Station.new(station)

    puts menu
  end

  if menu == 2
    puts "Let's Create Train. Please enter the name of the Object!"
    $train_class = gets.strip
    puts "Enter title train number: "
    train = gets.strip.capitalize
    puts "What type of the train? (Passenger or Cargo)"
    train_type = gets.strip

    if train_type == "Passenger"
      puts "Train created. Title: #{train} Type: #{train_type}"

      $train_class = PassengerTrain.new(train)

      puts menu
    elsif train_type == "Cargo"
      puts "Train created. Title: #{train} Type: #{train_type}"

      $train_class = CargoTrain.new(train)

      puts menu
    end
  end

  if menu == 3
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

break if menu == 0
end
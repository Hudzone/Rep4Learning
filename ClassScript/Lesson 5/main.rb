require_relative 'Car'
require_relative 'Driver'
require_relative 'SuperCar'
require_relative 'Track'

truck = Truck.new
truck.start_engine
puts "Track RPM is #{truck.current_rpm}"

sport_car = SportCar.new
sport_car.start_engine
puts "Sport car RPM is #{sport_car.current_rpm}"
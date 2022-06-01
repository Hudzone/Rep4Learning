class Car
  attr_accessor :speed 
  attr_reader :engine_volume

  def initialize(speed = 0,engine_volume)
    @speed = speed 
    @engine_volume = engine_volume
  end

  def start_engine
    puts "Wroom!"
  end

  def beep
    puts "beep beep!"
  end

  def stop_engine
    self.speed = 0
  end

  def go
    speed = 50
  end
end
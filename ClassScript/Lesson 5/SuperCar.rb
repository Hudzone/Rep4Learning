class SportCar < Car

  def start_engine
    puts "Click!"
    super
    puts "Wroom!"
  end

  def nitro
  end

  protected

  def initial_rpm
    1200
  end
end
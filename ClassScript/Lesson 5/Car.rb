class Car
  
  attr_reader :current_rpm

  def initialize
    @current_rpm = 0
  end  

  def start_engine
    # запустить двигатель, если он не запущен
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    # true, если обороты на нуле
    current_rpm.zero?
  end

  protected

  attr_writer :current_rpm

  def initial_rpm
    700
  end

  def start_engine!
    # устанавливает начальные обороты
    self.current_rpm = initial_rpm
  end

end
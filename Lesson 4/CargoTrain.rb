class CargoTrain < Train
  attr_reader :train_type

  def initialize(number)
    super
    @number = number
    @train_type = :cargo
  end
end
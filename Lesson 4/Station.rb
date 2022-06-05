class Station

  attr_reader :trains_at_station, :name

  def initialize(name)
    @name = name
    @trains_at_station = []
  end

  def train_arrives(train)
    trains_at_station << train
    puts "#{@name} arrived!"
  end

  def train_departure(train)
    trains_at_station.delete(train)
    puts "#{train} departured!"
  end
end
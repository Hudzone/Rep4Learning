class Station

  attr_reader :trains_at_station, :name

  def initialize(name)
    @name = name
    @trains_at_station = {}
  end

  def train_arrives(name, type)
    @name = name
    @type = type
    @trains_at_station[@name] = @type
    puts "#{@name} arrived!"
  end

  def trains_list
    if @trains_at_station.empty?
      puts "There are no trains at the station!"
    else
      puts "There are trains at the station: #{@trains_at_station}"
    end
  end

  def trains_list_by_type(type)
    @trains_at_station.each do |nm,tp|
      print "#{nm} ," if tp == type
    end
  end


  def train_departure(name)
    @trains_at_station.each do |nm, tp|
      if nm = name 
        @trains_at_station.delete(nm)
      end
    end

    puts "#{name} departured!"
  end
end
class Station

  @@trains_at_station = {}

  def initialize(name)
    @name = name
  end

  def train_arrives(name, type)
    @name = name
    @type = type
    @@trains_at_station[@name] = @type
    puts "#{@name} arrived!"
  end

  def trains_list
    if @@trains_at_station.empty?
      puts "There are no trains at the station!"
    else
      puts "There are trains at the station: #{@@trains_at_station}"
    end
  end

#Пытался сделать условия для ввода, но не получилось, не могу понять почему, оставляю код на всякий
=begin
  def trains_list_by_type
    print "Choose type of the train (Passenger or Cargo): "
    tp = gets.chomp

    if tp.empty? 
      puts "Incorrect data! Choose type of the train!"
    else
      tp = gets.chomp
    end

    if tp == "Passenger" || tp == "Cargo"
      tp = gets.chomp        
        @@trains_at_station.each do |nm, tp|
          puts nm if tp == type
        end        
    else
      puts "Incorrect type! Choose between Passenger and Cargo!"
    end
  end
=end

  def trains_list_by_type(type)
    @@trains_at_station.each do |nm,tp|
      print "#{nm} ," if tp == type
    end
  end


  def train_departure(name)
    @@trains_at_station.each do |nm, tp|
      if nm = name 
        @@trains_at_station.delete(nm)
      end
    end

    puts "#{name} departured!"
  end
end
puts 'Enter the day: '
day = gets.to_i

while day.nil? || day.negative? || day < 0 || day > 31
  puts "Please enter day from 1 to 31!"
  day = gets.to_i
end

puts "Enter the month: "
month = gets.to_i

while month.nil? || month.negative? || month <= 0 || month > 12
  puts "Please enter month from 1 to 12!"
  month = gets.to_i
end

puts "Enter the year: "
year = gets. to_i

while year.nil? || year.negative? || year > 2022
  puts "Please enter correct year!"
  year = gets.to_i
end

months_just_year = { 
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31 }

months_leap_year = { 
  1 => 31,
  2 => 29,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31 }

if year % 4 == 0
  if year % 100 == 0
      if year % 400 == 0
        total = 0
        months_leap_year.each do |mm,dd|
          total += dd
            if mm == month
              total = total - (dd - day)
            end
          break if month == mm
        end
        puts "Порядковый номер #{day}.#{month}.#{year} - #{total}"
      else 
        total = 0
        months_just_year.each do |mm,dd|
          total += dd
           if mm == month
              total = total - (dd - day)
           end
          break if month == mm
        end
        puts "Порядковый номер #{day}.#{month}.#{year} - #{total}"
      end
  else
    if year % 400 == 0
        total = 0
        months_leap_year.each do |mm,dd|
          total += dd
           if mm == month
              total = total - (dd - day)
           end
          break if month == mm
        end 
      puts "Порядковый номер #{day}.#{month}.#{year} - #{total}"
    end
  end
else 
  total = 0
  months_just_year.each do |mm,dd|
  total += dd
    if mm == month
      total = total - (dd - day)
    end
  break if month == mm
  end
  puts "Порядковый номер #{day}.#{month}.#{year} - #{total}"
end

sleep 2

puts "To exit the programm press Enter!"
gets


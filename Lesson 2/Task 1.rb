#Cделать хэш, содержащий месяцы и количество дней месяца. В цикле выводить те месяцы, у которых количество дней - 30

months = {
  "January" => "31 Days",
  "February" => "28 Days",
  "March" => "31 Days",
  "April" => "30 Days",
  "May" => "31 Days",
  "June" => "30 Days",
  "July" => "31 Days",
  "August" => "31 Days",
  "September" => "30 Days",
  "October" => "31 Days",
  "November" => "30 Days",
  "December" => "31 Days"
}

#Очень долго думал, как все это реализовать через цикл WHILE, так и не придумал, возможно дадите подсказку)
#Сделал через метод .each

months.each do |mm,dd|
  puts mm if dd == "30 Days"
end

sleep 2

puts "Press Enter to exit"
gets
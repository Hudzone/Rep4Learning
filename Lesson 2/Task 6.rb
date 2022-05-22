#Сумма покупок

puts "Welcome to out marketplace, enter a products you'd like to buy!"

marketplace = {}

loop do 
puts "Enter the item's title (if you want to interrupt type STOP): "
title = gets.chomp

while title.empty? 
  puts "Enter the title of item!"
  title = gets.chomp
end

break if title == "STOP"

puts "Enter the price per 1 item ($) : "
price = gets.to_f

while price.nil? || price.negative?
  puts "Please, enter correct price!"
  price = gets.to_f
end

puts "Enter an amount of items: "
amount = gets.to_f

while amount.nil? || amount.negative?
  puts "Please, enter correct ammount!"
  amount = gets.to_f
end

marketplace[title] = { "price" => price, "amount" => amount }

end

puts marketplace

10.times do
  print "* " 
  sleep 0.2
end

puts "\n"

total = 0
total_sum = 0

marketplace.each do |item_title,item_price_amount|
  total = item_price_amount["price"] * item_price_amount["amount"]
  puts ">>> #{item_title} : #{item_price_amount["amount"]} pieces * #{item_price_amount["price"]}$. TOTAL: #{total}$"
  total_sum += total
  
end

puts "\n"

puts "To finish the program, press Enter!"
gets


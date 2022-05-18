puts "Как вас зовут?: "
name = gets.chomp

puts "Привет, #{name}! Какой у Вас рост?"
height = gets.to_f

ideal_weight = (height - 110) * 1.15

if ideal_weight >= 0
	puts "Итак, #{name}, Ваш идеальный вес - #{ideal_weight}"
else
	puts "Поздравляем, #{name} Ваш вес оптимален!"
end

sleep 2
print "Всего хорошего! Для выхода из программы нажмите Enter"
gets
puts "Введите основание треугольника (см): "
osn = gets.to_f

puts "Введите высоту треугольника (см): "
vys = gets.to_f

plsh = 0.5*osn*vys

5.times do 
	print ". "
	sleep 0.3
end

puts

puts "Площадь треугольника равна #{plsh}"
sleep 2
puts "Для выхода из программы нажмите Enter"
gets
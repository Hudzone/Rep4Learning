puts "Введите первую сторону треугольника: "
a = gets.to_f

puts "Введите вторую сторону треугольника: "
b = gets.to_f

puts "Введите третью сторону треугольника: "
c = gets.to_f

#Вычисляю гиппотенузу и катеты
if a >= b and a >= c 
	hypotenuse = a 
	katet1 = b
	katet2 = c 
elsif b >= a and b >= c 
	hypotenuse = b 
	katet1 = a 
	katet2 = c 
else c >= a and c >= b
	hypotenuse = c 
	katet1 = a 
	katet2 = b 
end

#Условия для равностороннего треугольника
if a == b and b == c 
	puts "Треугольник равносторонний!"
end

#Условия для прямоугольного треугольника
if hypotenuse**2 == katet1**2 + katet2**2
	puts "Треугольник прямоугольный!"
end

#Условия для равнобедренного треугольника
if a == b 
  puts "Треугольник равнобедренный!"
elsif a == c
  puts "Треугольник равнобедренный!"
else b == c 
	puts "Треугольник равнобедренный!"
end

sleep 2

puts "Для завершения программы нажмите Enter"
gets

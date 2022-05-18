puts "Введите коэффициент a: "
a = gets.to_i

puts "Введите коэффициент b: "
b = gets.to_i

puts "Введите коэффициент c: "
c = gets.to_i

dis = b**2 - (4*a*c)
x1 = ((-b) + Math.sqrt(dis))/(2*a)
x2 = ((-b) - Math.sqrt(dis))/(2*a)

if dis > 0
	puts "D = #{dis}, X1 = #{x1}, x2 = #{x2}"
elsif dis == 0
	puts "D = #{dis}, X1 = #{x1}"
else dis < 0
	puts "D = #{dis}, корней нет!"
end

sleep 2

puts "Для завершения программы нажмите Enter"
gets
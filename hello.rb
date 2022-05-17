puts "Привет, как тебя зовут?"
name = gets.chomp

puts "А в каком году родился?"
yob = gets.to_i

5.times do 
	print ". "
	sleep 0.3
	
end

print "\n"

puts "А, тебя #{name} зовут? Круто, тебе получается где то #{yob} годиков?"
sleep 3
puts "Ну ладно, пока!"

sleep 1
puts "Нажмите Enter чтобы попрощаться"
gets
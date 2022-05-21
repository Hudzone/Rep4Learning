#Заполнить хэш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите.


#Попробовал так, ключ присвоился корректно, а вот значение почему то посленднее. Не могу понять почему
#letters = ("a".."z").to_a
#numerals = (1..26).to_a
#alphabet = {}
#letters.each do |letter|
# numerals.each do |number|
#   alphabet[letter] = number
# end
#end

letters = ("a".."z").to_a
numerals = (1..26).to_a

alphabet = letters.zip(numerals).to_h

puts alphabet
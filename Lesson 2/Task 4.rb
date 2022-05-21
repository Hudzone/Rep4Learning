#Заполнить хэш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите.


vowels = ["a","e","i","o","u","y"]
numerals = (1..6).to_a

letters = vowels.zip(numerals).to_h

puts letters
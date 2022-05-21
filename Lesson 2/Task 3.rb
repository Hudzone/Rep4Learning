#Заполнить массив числами фибоначчи до 100

fibonacci = [0,1]

while fibonacci.max < 100 do
  fibonacci << fibonacci.last(2).sum
end

fibonacci.delete_at(-1)

puts fibonacci
def sGuess(num)
  puts "Is the number #{num}? y/n"
  ans = gets.chomp
  if ans == "y"
    return 1
  elsif ans == "n"
    return 0
  end
end

def ask
  puts "Is the guess\n\t1. low\n\t2. high"
  ans = gets.chomp.to_i
  if ans == 1
    return 0
  elsif ans == 2
    return 1
  end
end

puts "Tell me the lowest number."
#lowest number
ln = gets.chomp.to_i

puts "Tell me the highest number."
#highest number
hn = gets.chomp.to_i
system "clear"

found = false
range = hn

#highest possible guess
hpg = hn

#main guessing process
while !found
  guess = hpg/2
  #if guess is only in range
  if guess >= ln && guess <= hn
    #ask if the number is equal to guess
    ok = sGuess(guess)
    #if not
    if ok == 0
      #ask the condition of the guess
      cdt = ask
      #if no more number left
      if guess == hn && cdt != 1
        raise "No more number to guess!"
      elsif guess == ln && cdt != 0
        raise "No more number to guess!"
      end
      #if condition is high
      if cdt == 1
        hpg = hpg - range
      elsif cdt == 0 #if condition is low
        hpg = hpg + range
      end
    elsif ok == 1 #if number is equal to guess
      found = true
    end
  end
  system "clear"
  range = range - 2 #decrease range after every guess
end
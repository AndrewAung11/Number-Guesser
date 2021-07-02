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
  ans = hpg/2
  #if answer is only in range
  if ans >= ln && ans <= hn
    guess = sGuess(ans)
    if guess == 0
      cdt = ask
      #if no more number left
      if ans == hn && cdt != 1
        raise "No more number to guess!"
      elsif ans == ln && cdt != 0
        raise "No more number to guess!"
      end
      if cdt == 1
        hpg = hpg - range
      elsif cdt == 0
        hpg = hpg + range
      end
    elsif guess == 1
      found = true
    end
  end
  system "clear"
  range = range - 2
end
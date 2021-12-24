# frozen_string_literal: true

require_relative 'functions'

puts('Enter N:')
n = gets.to_f

puts "Define integral : #{definite_integral(n)}"
puts "Define advanced integral : #{definite_integral_advanced(n)}"
puts

mml = minmax_block(&proc {
  max_val_1 = (0 - 1) / (0 + 2)
  min_val_1 = max_val_1
  max_val_2 = Math.sin(-1.5)
  min_val_2 = max_val_2
  (0..2).step(0.01).each do |x|
    max_val_1 = (x - 1) / (x + 2) if max_val_1 < (x - 1) / (x + 2)
    mix_val_1 = (x - 1) / (x + 2) if min_val_1 > (x - 1) / (x + 2)
  end
  (-1..1).step(0.01).each do |x|
    max_val_2 = Math.sin(x / 2 - 1) if max_val_2 < Math.sin(x / 2 - 1)
    mix_val_2 = Math.sin(x / 2 - 1) if min_val_2 > Math.sin(x / 2 - 1)
  end
  [min_val_1, max_val_1, min_val_2, max_val_2]
})

mmb = minmax_block do
  max_val_1 = (0 - 1) / (0 + 2)
  min_val_1 = max_val_1
  max_val_2 = Math.sin(-1.5)
  min_val_2 = max_val_2
  (0..2).step(0.01).each do |x|
    max_val_1 = (x - 1) / (x + 2) if max_val_1 < (x - 1) / (x + 2)
    mix_val_1 = (x - 1) / (x + 2) if min_val_1 > (x - 1) / (x + 2)
  end
  (-1..1).step(0.01).each do |x|
    max_val_2 = Math.sin(x / 2 - 1) if max_val_2 < Math.sin(x / 2 - 1)
    mix_val_2 = Math.sin(x / 2 - 1) if min_val_2 > Math.sin(x / 2 - 1)
  end
  [min_val_1, max_val_1, min_val_2, max_val_2]
end

puts 'Min and max values f(x) = (x - 1)/(x + 2) on [0, 2] using Proc : ', mml[0], mml[1]
puts 'Min and max values g(x) = sin(x / 2 - 1) on [-1, 1] using Proc : ', mml[2], mml[3]
puts 'Min and max values f(x) = (x - 1)/(x + 2) on [0, 2] using Block : ', mmb[0], mmb[1]
puts 'Min and max values g(x) = sin(x / 2 - 1) on [-1, 1] using Block : ', mmb[2], mmb[3]

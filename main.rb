# frozen_string_literal: true

require_relative 'functions'

puts('Enter x:')
x = gets.to_f
puts calc_y(x)

puts('Enter string:')
kol_corr = 0
while (str = gets.chomp) != ''
  corr_str, n = correction_str(str)
  kol_corr += n
  puts('Before correction: ', str)
  puts('After correction: ', corr_str)
  puts('Enter string:')
end
puts('Number of correction: ', kol_corr)

require_relative 'functions'

(20..40).step(10).each do |n|
  print('Function: definite_integral, Number of segments = ', n, ', error =',
        calculate_error_for_integral(definite_integral(n)), "\n")
  print('Function: definite_integral_advanced, Number of segments = ', n, ', error = ',
        calculate_error_for_integral(definite_integral_advanced(n)), "\n")
end

f_x_1 = ->(x) { (x - 1) / (x + 2) }
f_x_2 = ->(x) { Math.sin(x / 2 - 1) }
mi1, ma1 = minmax(f_x_1, 0, 2)
mi2, ma2 = minmax(f_x_2, -1, 1)
print('Minimum point of the function f(x) = (x - 1) / (x + 2) on [0, 2] : ', mi1, "\n")
print('Maximum point of the function f(x) = (x - 1) / (x + 2) on [0, 2] : ', ma1, "\n")
print('Minimum point of the function f(x) = sin(x/2 - 1) on [-1, 1] : ', mi2, "\n")
print('Maximum point of the function f(x) = sin(x/2 - 1) on [-1, 1] : ', ma2, "\n")

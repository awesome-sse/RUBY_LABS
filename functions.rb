def calc_y(x)
  Math.log(x) / Math.cos(x)**2 + x**3 - 5
end

def correction_str(str)
  kol = 0
  words = str.split(' ')
  (0..words.length - 1).each do |i|
    if /[^[a-zA-Z0-9]]/.match(words[i])
      words[i] = ''
      kol += 1
    elsif /[a-zA-Z]/.match(words[i]) and /[0-9]/.match(words[i][0])
      words[i][0] = '_'
      kol += 1
    end
  end
  str = words.join(' ')
  [str, kol]
end

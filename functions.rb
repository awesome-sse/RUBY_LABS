# frozen_string_literal: true

def calc_y(x)
  Math.log(x) / Math.cos(x)**2 + x**3 - 5
end

def correction_str(str)
  newword = true
  kol = 0
  ans = ''
  str.each_char.map do |ch|
    if ch.eql?(' ')
      newword = true
      ans += ' '
    elsif newword && /[0-9]/.match(ch)
      newword = false
      ans += '_'
      kol += 1
    elsif /[a-zA-Z0-9]/.match(ch)
      ans += ch
      newword = false
    else
      newword = false
      kol += 1
    end
  end
  [ans, kol]
end

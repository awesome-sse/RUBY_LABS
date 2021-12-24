# frozen_string_literal: true

class Triangle
  def initialize(a0 = 0, a1 = 0, b0 = 0, b1 = 0, c0 = 0, c1 = 0)
    @a = [a0, a1]
    @b = [b0, b1]
    @c = [c0, c1]
  end

  def print_
    print('a = ', @a, ' ', 'b = ', @b, ' ', 'c = ', @c, "\n")
  end

  def get_a
    @a
  end

  def get_b
    @b
  end

  def get_c
    @c
  end

  def get_square
    ab = 0
    bc = 0
    ac = 0
    (0..@a.size - 1).each do |i|
      ab += (@a[i] - @b[i])**2
      bc += (@b[i] - @c[i])**2
      ac += (@a[i] - @c[i])**2
    end
    ab **= 0.5
    bc **= 0.5
    ac **= 0.5
    p = (ab + bc + ac) / 2
    (p * (p - ab) * (p - bc) * (p - ac))**0.5
  end
end

class Prizm < Triangle
  def initialize(a0 = 0, a1 = 0, b0 = 0, b1 = 0, c0 = 0, c1 = 0, h = 0)
    super(a0, a1, b0, b1, c0, c1)
    @h = h
  end

  def get_h
    @h
  end

  def print_
    super()
    print('h = ', @h, "\n")
  end

  def get_square
    ab = 0
    bc = 0
    ac = 0
    (0..@a.size - 1).each do |i|
      ab += (@a[i] - @b[i])**2
      bc += (@b[i] - @c[i])**2
      ac += (@a[i] - @c[i])**2
    end
    ab **= 0.5
    bc **= 0.5
    ac **= 0.5
    2 * super() + @h * (ab + bc + ac)
  end
end

p = Prizm.new(0, 0, 1, 1, 2, 2, 3)
p.print_
puts p.get_a
puts p.get_b
puts p.get_c
puts p.get_square

class Triangle

    def initialize (a0 = 0, a1 = 0, b0 = 0, b1 = 0, c0 = 0, c1 = 0)
        @a = [a0, a1]
        @b = [b0, b1]
        @c = [c0, c1]
    end
    def print_()
        print("a = ", @a, " ", "b = ", @b, " ", "c = ", @c)
    end
    def get_a()
        return @a
    end
    def get_b()
        return @b
    end
    def get_c()
        return @c
    end
    def get_square()
        ab = 0
        bc = 0
        ac = 0
        (0..@a.size - 1).each do |i|
            ab += (@a[i] - @b[i]) ** 2
            ab += (@b[i] - @c[i]) ** 2
            ab += (@a[i] - @c[i]) ** 2
        end
        ab = ab ** 0.5
        bc = bc ** 0.5
        ac = ac ** 0.5
        p = (ab + bc + ac) / 2
        return (p * (p - ab) * (p - bc) * (p - ac))**0.5
    end
end

class Prizm < Triangle
    def initialize (a0 = 0, a1 = 0, a2 = 0, b0 = 0, b1 = 0, b2 = 0, c0 = 0, c1 = 0, c2 = 0)
        @a = [a0, a1, a2]
        @b = [b0, b1, b2]
        @c = [c0, c1, c2]
    end
end

p = Prizm.new(0, 0, 0, 3, 3, 0, 4 , 4, 4)
p.print_
puts p.get_a
puts p.get_b
puts p.get_c
puts p.get_square

def definite_integral(n)
  ans = 0.0
  start_ = Math::PI / 4
  end_ = Math::PI / 3
  step_ = if n > 1
            (end_ - start_) / (n - 1)
          else
            (end_ - start_)
          end
  (start_..(end_ - step_)).step(step_).each do |i|
    ans += (Math.tan(i)**2 + Math.tan(i + step_)**2) / 2 * step_
  end
  ans
end

def definite_integral_advanced(n)
  start_ = Math::PI / 4
  end_ = Math::PI / 3
  step_ = if n > 1
            (end_ - start_) / (n - 1)
          else
            (end_ - start_)
          end
  e = Enumerator.new do |y|
    i = Math::PI / 4
    ans = 0.0
    loop do
      ans += (Math.tan(i)**2 + Math.tan(i + step_)**2) / 2 * step_
      y.yield(ans)
      i += step_
    end
  end

  e.take(n).last
end

def calculate_error_for_integral(val)
  (val - (Math.sqrt(3) - Math::PI / 12 - 1)).abs
end

def minmax(f_x, a, b)
  max_val = f_x.call(a)
  max_i = a
  min_val = f_x.call(b)
  min_i = a
  (a..b).step(0.01).each do |x|
    if f_x.call(x) > max_val
      max_val = f_x.call(x)
      max_i = x
    end
    if f_x.call(x) < min_val
      min_val = f_x.call(x)
      min_i = x
    end
  end
  [min_i, max_i]
end

def minmax_block(a, b)
  max_val = (yield a)
  max_i = a
  min_val = (yield a)
  min_i = a
  (a..b).step(0.01).each do |x|
    if (yield x) > max_val
      max_val = (yield x)
      max_i = x
    end
    if (yield x) < min_val
      min_val = (yield x)
      min_i = x
    end
  end
  [min_i, max_i]
end

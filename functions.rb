# frozen_string_literal: true

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

  e.take(n - 1).last
end

def minmax_block
  yield if block_given?
end

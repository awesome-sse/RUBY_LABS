# frozen_string_literal: true

class Solve
  class << self
    def call(params)
      new(params).send :execute
    end
  end

  private

  def initialize(params)
    @array = params[:a]&.split&.map { |x| Integer(x) }
    @error_input = false
  rescue ArgumentError
    @error_input = true
  end

  def execute
    # here comes the solution!
    return unless !@error_input && !@array.nil?

    ans = []
    n = @array.length
    n.times do |p1|
      (p1+1..n - 1).each do |p2|
        break unless @array[p2] > @array[p2-1]

        ans << [@array[p1..p2], (p1 == p2 ? [p1] : [p1, p2])]
      end
    end
    ans
  end
end

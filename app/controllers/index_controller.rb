# frozen_string_literal: true

class IndexController < ApplicationController
  def input; end

  def ajax_output
    @result = Solve.call params
    if @result.nil?
      @error = 'Некорректный ввод'
    elsif @result.length.positive?
      @longest_one = @result[@result.map { |a| a[0].length }.each_with_index.max[1]]
    end
  end

end

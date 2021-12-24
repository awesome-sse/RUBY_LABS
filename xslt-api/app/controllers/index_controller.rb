# frozen_string_literal: true

class IndexController < ApplicationController
  def input
    result = Solve.call params
    if result.nil?
      error = 'Некорректный ввод'
    elsif result.length.positive?
      longest_one = [result[result.map { |a| a[0].length }.each_with_index.max[1]]]
    end

    data = { 'results' => result&.map do |el|
                            { sub: el[0], idx: el[1] }
                          end, 'error' => error, 'longests' => longest_one&.map do |el|
                                                                 { sub: el[0], idx: el[1] }
                                                               end }

    respond_to do |format|
      format.html { render inline: data.to_s }
      format.xml { render xml: data.to_xml }
      format.rss { render xml: data.to_xml }
    end
  end
end

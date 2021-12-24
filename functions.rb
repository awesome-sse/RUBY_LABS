# frozen_string_literal: true

def parse_file(from, into)
  m = -100_000_000
  kol = 0
  File.open(from).each do |line|
    line.split(' ').each do |i|
      kol += 1
      m = i.to_i if i.to_i > m
      next unless (kol % 5).zero?

      File.open(into, 'a') do |file|
        file.write m, ' '
      end
      kol = 0
      m = -100_000_000
    end
  end
end

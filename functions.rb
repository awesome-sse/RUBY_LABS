def parse_file(from, into)
    m = -100000000
    kol = 0
    File.open(from).each do |line|
        line.split(" ").each do |i|
            kol += 1
            if i.to_i > m 
                m = i.to_i
            end
            if (kol % 5 == 0)   
                File.open(into, "a") do |file|
                    file.write m, " " 
                end
                kol = 0
                m = -100000000
            end
        end
    end
end

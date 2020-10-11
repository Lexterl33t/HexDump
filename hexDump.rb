def hexdump(file, width = 16, padding = '.')
    ascii = ''
    lnum = 0

    File.open(file).each_byte.each_slice(width) do |bytes|
        print '%06x  ' % lnum

        bytes.map do |byte|
            print '%02X  ' % byte
            ascii << (byte.between?(32, 126)? byte : padding)
            lnum += 1
        end
        puts '    ' * (width - ascii.length) + ascii
        ascii.clear

    end
    
end

hexdump("ocraRuby.exe")

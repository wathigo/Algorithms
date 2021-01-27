class String
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end

class RunLengthEncoding
    def self.encode input_str
        frequency = Hash.new(0)
        encoded_str = ''
        input_str.split("").each_with_index do | char, i |
            prev_char = i != 0 ? input_str.split("")[i-1] : ""
            frequency[char] += 1
            if char != prev_char || i == input_str.size - 1
                frequency_mag = frequency[prev_char] <= 1 ? '' : frequency[prev_char].to_s
                encoded_str = encoded_str << frequency_mag << prev_char
                frequency[prev_char] = 0
            end
            encoded_str = encoded_str << char if i == input_str.length - 1
        end
        encoded_str
    end

    def self.decode input_str
        decoded_str = ""
        str_arr = input_str.split("")
        index = 0
        while index < str_arr.length  
            if str_arr[index].is_i?
                (1..str_arr[index].to_i).each do |count|
                    decoded_str == decoded_str << str_arr[index+1]
                end
                index += 2
            else
                decoded_str = decoded_str << str_arr[index]
                index += 1
            end
        end
        decoded_str
    end
end

# puts RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
# 12WB12W3B24W
# 12WB12W3B24WB

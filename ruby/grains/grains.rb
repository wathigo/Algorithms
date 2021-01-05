class Grains 
    def self.square num
        raise ArgumentError.new("Invalid Argument") if num <= 0 || num > 64
        no_of_grains = self.calculate num 
    end

    def self.total
        total = 0
        (1..64).each do |square|
            total += self.calculate square
        end
        total
    end

    def self.calculate num
        counter = 1
        grains = 1
        while counter < num
            grains *= 2
            counter += 1
        end 
        grains
    end
end

puts Grains.square(16)
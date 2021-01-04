GIVEN_ITEMS = [
    "Partridge in a Pear Tree.",
    "Turtle Doves",
    "French Hens",
    "Calling Birds",
    "Gold Rings",
    "Geese-a-Laying",
    "Swans-a-Swimming",
    "Maids-a-Milking",
    "Ladies Dancing",
    "Lords-a-Leaping",
    "Pipers Piping",
    "Drummers Drumming",
]
DAYS = {
    "first": "a",
    "second": "two",
    "third": "three",
    "fourth": "four",
    "fifth": "five",
    "sixth": "six",
    "seventh": "seven",
    "eighth": "eight",
    "ninth": "nine",
    "tenth": "ten",
    "eleventh": "eleven",
    "twelfth": "twelve"
}

class TwelveDays
    @first_phrase = "On the "
    @second_prase = " day of Christmas my true love gave to me:"

    def self.song
        song = ""
        counter = 0;
        items = "";
        DAYS.each do |day, num|
            app_str = counter == 0 ? "" : ","
            items = items.prepend(" " << num.to_s << " " << GIVEN_ITEMS[counter] << app_str)
            new_line = counter == 11 ? "" : "\n\n"
            song << self.generate_rhyme(items, day) << new_line
            items.prepend(" and") if counter == 0
            counter += 1
        end
        song
    end

    def self.generate_rhyme(items, day)
        @first_phrase.dup << day.to_s << @second_prase.dup <<  items
    end
end 

puts (TwelveDays.song)
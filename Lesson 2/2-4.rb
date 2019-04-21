alphabet = "a".."z"

vowels = [ "a", "e", "i", "o", "u", "y" ]

hsh = {}

alphabet.each_with_index { |char, index| hsh[index + 1] = char if vowels.include?(char) }

puts hsh
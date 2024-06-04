def caesar_cipher(string, shift_factor)
  new_string = string.split('').map do |char|    # cycle through each character 1 at a time
    # determin if char is upper- or lower-case, don't encrypt if neither
    case char
    when /[a-z]/
      encrypt_char(char, shift_factor, [97, 122])
    when /[A-Z]/
      encrypt_char(char, shift_factor, [65, 90])
    else
      char
    end
  end.join
  puts "Your encrypted message is:\n#{new_string}"
end

def encrypt_char(char, shift_factor, byte_range)
  new_byte = char.getbyte(0) + shift_factor   # convert char to its integer byte value & add

  # if new value is out of range, put in range to 'wrap' around  (z to a, a to z, etc.)
  if new_byte > byte_range[1]
    ((new_byte - byte_range[1]) / 26.0).ceil.times do    # I spent way too long getting this
      new_byte = new_byte - 26                           # to work with shift_factors >= 26
    end                                                  # ...no I don't want to talk about it
  elsif new_byte < byte_range[0]
    ((byte_range[0] - new_byte) / 26.0).ceil.times do
      new_byte = new_byte + 26
    end
  end
  return new_byte.chr #return new byte as character
end

puts "What phrase would you like to encrypt?:"
phrase = gets.chomp

puts "Enter a shift factor:"
shift = gets.chomp.to_i

caesar_cipher(phrase, shift)
module Morse
  extend self

  VERSION = "1.0.0"

  MORSE_CODES = {
    'a' => ".-",
    'b' => "-...",
    'c' => "-.-.",
    'd' => "-..",
    'e' => ".",
    'f' => "..-.",
    'g' => "--.",
    'h' => "....",
    'i' => "..",
    'j' => ".---",
    'k' => "-.-",
    'l' => ".-..",
    'm' => "--",
    'n' => "-.",
    'o' => "---",
    'p' => ".--.",
    'q' => "--.-",
    'r' => ".-.",
    's' => "...",
    't' => "-",
    'u' => "..-",
    'v' => "...-",
    'w' => ".--",
    'x' => "-..-",
    'y' => "-.--",
    'z' => "--..",

    '0' => "-----",
    '1' => ".----",
    '2' => "..---",
    '3' => "...--",
    '4' => "....-",
    '5' => ".....",
    '6' => "-....",
    '7' => "--...",
    '8' => "---..",
    '9' => "----.",

    '.' => ".-.-.-",
    ',' => "−−..−−",
    ':' => "---...",
    '?' => "..--..",
    '’' => ".----.",
    '(' => "-.--.",
    ')' => "-.--.-",
    '@' => ".--.-.",
    '+' => ".-.-.",
    '-' => "-....-",
    '*' => "-..-",
    '/' => "-..-.",
    '=' => "-...-",
    ' ' => '/'
  }

  class Error < Exception
  end

  def encode(text : String)
    String.build do |io|
      text.downcase.each_char do |char|
        begin
          io << MORSE_CODES[char]
        rescue KeyError
          raise Error.new "Cannot encode #{char.inspect}"
        end
        io << ' '
      end
    end.rchop
  end

  def decode(morse_code : String)
    String.build do |io|
      morse_code.split(' ').each do |code|
        MORSE_CODES.each do |morse|
          if code == morse[1]
            io << morse[0]
          end
        end
      end
    end
  end

  def play(morse_code : String)
    morse_code.split(' ').each do |code|
      code.each_char do |char|
        print '\u{7}' if char == '.'
        sleep 0.25
      end
    end
  end
end
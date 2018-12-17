module Morse
  CODE = {
    # Letters
    'A' => ".-",
    'B' => "-...",
    'C' => "-.-.",
    'D' => "-..",
    'E' => ".",
    'F' => "..-.",
    'G' => "--.",
    'H' => "....",
    'I' => "..",
    'J' => ".---",
    'K' => "-.-",
    'L' => ".-..",
    'M' => "--",
    'N' => "-.",
    'O' => "---",
    'P' => ".--.",
    'Q' => "--.-",
    'R' => ".-.",
    'S' => "...",
    'T' => "-",
    'U' => "..-",
    'V' => "...-",
    'W' => ".--",
    'X' => "-..-",
    'Y' => "-.--",
    'Z' => "--..",

    # Numbers
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

    # Punctuation
    ')'  => "-.--.-",
    '('  => "-.--.",
    '='  => "-...-",
    '!'  => "-.-.--",
    '?'  => "..--..",
    '.'  => ".-.-.-",
    ':'  => "---...",
    ';'  => "-.-.-.",
    ','  => "--..--",
    '-'  => "-....-",
    '+'  => ".-.-.",
    '"'  => ".-..-.",
    '/'  => "-..-.",
    '&'  => ".-...",
    '\'' => ".----.",
    '@'  => ".--.-.",
    '_'  => "..--.-",
    '$'  => "...-..-",

    # Non-English letters
    'À' => ".--.-",
    'Ä' => ".-.-",
    'Å' => ".--.-",
    'Ą' => ".-.-",
    'Æ' => ".-.-",
    'Ć' => "-.-..",
    'Ĉ' => "-.-..",
    'Ç' => "-.-..",
    'Đ' => "..-..",
    'Ð' => "..--.",
    'É' => "..-..",
    'È' => ".-..-",
    'Ę' => "..-..",
    'Ĝ' => "--.-.",
    'Ĥ' => "----",
    'Ĵ' => ".---.",
    'Ł' => ".-..-",
    'Ń' => "--.--",
    'Ñ' => "--.--",
    'Ö' => "---.",
    'Ó' => "---.",
    'Ø' => "---.",
    'Ś' => "...-...",
    'Ŝ' => "...-.",
    'Š' => "----",
    'Þ' => ".--..",
    'Ü' => "..--",
    'Ŭ' => "..--",
    'Ź' => "--..-.",
    'Ż' => "--..-",

    ' ' => '/',
  }

  class Error < Exception
  end

  def self.encode(text : String)
    String.build do |io|
      iterator = text.upcase.each_char
      loop do
        char = iterator.next

        io << Morse.encode(char.as(Char))

        break if iterator.@end

        io << ' '
      end
    end
  end

  def self.decode(morse_code : String)
    String.build do |io|
      morse_code.split(' ').each do |code|
        begin
          io << CODE.key_for(code)
        rescue KeyError
          raise Error.new "invalid morse code #{code.inspect}"
        end
      end
    end
  end

  def self.encode(character : Char)
    CODE[character.upcase]
  rescue KeyError
    raise Error.new "cannot encode #{character.inspect}"
  end

  def self.play(morse_code : String, delay = 0.20)
    morse_code.each_char do |char|
      print '\a' if char == '.'
      sleep delay
    end
  end
end

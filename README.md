# morse

A library to encode, decode and play morse code

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     morse:
       github: r00ster91/morse
   ```

2. Run `shards install`

## Usage

```crystal
require "morse"

# Encode text to morse code:
morse_code = Morse.encode("hello") # => ".... . .-.. .-.. ---"

# Decode morse code to text:
Morse.decode(morse_code) # => "HELLO"

# Or play morse code: (this will play sounds)
Morse.play(morse_code)
```

## Contributing

1. Fork it (https://github.com/r00ster91/morse/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [r00ster](https://github.com/r00ster91) - creator and maintainer

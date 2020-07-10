# Portable Action Notation

[![Build Status](https://travis-ci.org/sashite/pan.cr.svg?branch=master)](https://travis-ci.org/sashite/pan.cr)

A Crystal interface for data serialization in [PAN](https://developer.sashite.com/specs/portable-action-notation) format.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     pan:
       github: sashite/pan.cr
   ```

2. Run `shards install`

## Usage

Working with PAN can be very simple, for example:

```crystal
require "pan"

# Emit a PAN string

actions = [
  {52, 36, "♙", nil}
]

PAN.dump(*actions) # => "52,36,♙"

# Parse a PAN string

PAN.parse("52,36,♙") # => [{52, 36, "♙", nil}]
```

## Examples

```crystal
# Black castles on king-side

PAN.dump({60, 62, "♔", nil}, {63, 61, "♖", nil}) # => "60,62,♔;63,61,♖"
PAN.parse("60,62,♔;63,61,♖") # => [{60, 62, "♔", nil}, {63, 61, "♖", nil}]

# Promoting a chess pawn into a knight

PAN.dump({12, 4, "♘", nil}) # => "12,4,♘"
PAN.parse("12,4,♘") # => [{12, 4, "♘", nil}]

# Capturing a rook and promoting a shogi pawn

PAN.dump({33, 24, "+P", "R"}) # => "33,24,+P,R"
PAN.parse("33,24,+P,R") # => [{33, 24, "+P", "R"}]

# Dropping a shogi pawn

PAN.dump({nil, 42, "P", nil}) # => "*,42,P"
PAN.parse("*,42,P") # => [{nil, 42, "P", nil}]

# Capturing a white chess pawn en passant

PAN.dump({33, 32, "♟", nil}, {32, 40, "♟", nil}) # => "33,32,♟;32,40,♟"
PAN.parse("33,32,♟;32,40,♟") # => [{33, 32, "♟", nil}, {32, 40, "♟", nil}]
```

## License

This library is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## About Sashite

This library is maintained by [Sashite](https://sashite.com/).

With some [lines of code](https://github.com/sashite/), let's share the beauty of Chinese, Japanese and Western cultures through the game of chess!

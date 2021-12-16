# This is exceptionally tough, in way over my head!


##-----  Problem description  -----

# Message transmitted in hexadecimal
# BITS transmission consists of a packet in hexadecimal, which might contain some additional 0 bits at the end.
# Each packet begins with a header:
  # First 3 bits are the version
  # next three bits are the type ID
  # These are both numbers
  # These are encoded as numbers with the most significant digit (i.e. 1) first: 4 = 100 (0100)

# Packets with a type ID = 4 are a literal value, which encode a single binary number.
  # The binary number is padded with leading zeroes until its length = 4
  # Then it is broken into four groups of 4 bits
  # Each group is prefixed by a 1 bit, except for the last group, which is prefixed by a 0
  # These groups of five bits immediately follow the packet header


# Example:

# "D2FE28" becomes "110 100 10111 11110 00101000"

  # 110 = 0110 = 6 (packet version) - pad with leading zero
  # 100 = 0100 = 4 (type ID) - pad with lead leading zero
  # 10111 = 0111 - remove leading 1
  # 11110 = 1110 - remove leading 1
  # 00101 = 0101 - remove leading 0
  # 000 at end to be ignored

# Which yields 0111 1110 0101 = 2021 in decimal, apparently (??)


# 2021 = 0010 0000 0010 0001




hex_conversion <- data.frame(
  hex = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
            "A", "B", "C", "D", "E", "F"),
  binary = c("0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001",
                  "1010", "1011", "1100", "1101", "1110", "1111")
)


# https://stackoverflow.com/questions/19502092/convert-hex-to-decimal-in-r

# To convert hexadecimal to decimal use base::strtoi(), but need to prefix with "0x" (except when you don't)

# as.numeric() also works if hex is prefixed by "0x"


# To convert decimal to binary, use R.utils::intToBin()

# Or with the base R function intToBits() function - but this produces a 32-bit length

paste(rev(as.integer(intToBits(12))), collapse = "")

# https://stackoverflow.com/questions/12088080/how-to-convert-integer-number-into-binary-vector?noredirect=1&lq=1

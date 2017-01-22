class RomanNumeral
  attr_accessor :roman_string, :decimal_val

  SPECIALS = {
    'CM': 900,
    'CD': 400,
    'XC': 90,
    'XL': 40,
    'IX': 9,
    'IV': 4,
  }

  HASHROMAN = {
    'CM': 900,
    'CD': 400,
    'XC': 90,
    'XL': 40,
    'IX': 9,
    'IV': 4,
    'M': 1000,
    'D': 500,
    'C': 100,
    'L': 50,
    'X': 10,
    'V': 5,
    'I': 1,
  }

  def initialize( numeral_string )
    @roman_string = numeral_string
    @decimal_val = RomanNumeral.decimal_value(numeral_string)
  end

  def self.romanize(decimal)
    roman=""
    HASHROMAN.sort_by {|num, val| val }.reverse.each{|num, val|
      letter=num.to_s # It's a symbol at this point, and we should explicitly turn it to a string.
      num_of_times_letter = (decimal/val).floor
      roman=roman+letter*num_of_times_letter
      decimal=decimal-(decimal/val).floor*val
    }
    roman
  end

  def self.decimal_value(numerical_string)
    working_roman = numerical_string
    total = 0
      HASHROMAN.each{|num,val|
        count = working_roman.scan(/#{num}/).count
        total += count * val
        working_roman = working_roman.gsub(/#{num}/,'')
      }
    total
  end

  def +( other_roman )
    dec_num = other_roman.decimal_val + decimal_val
    RomanNumeral.romanize(dec_num)
  end

  def -( numeral_string )
    print numeral_string
    dec_num = decimal_val - numeral_string.decimal_val
    dec_num >0 ? RomanNumeral.romanize(dec_num) : "-" + RomanNumeral.romanize(dec_num.abs)
  end

  def *( other_roman )
    dec_num = other_roman.decimal_val * decimal_val
    RomanNumeral.romanize(dec_num)
  end

  def /( numeral_string )
    print numeral_string
    dec_num = (decimal_val / numeral_string.decimal_val).floor
    dec_num >0 ? RomanNumeral.romanize(dec_num) : "-" + RomanNumeral.romanize(dec_num.abs)
  end
end
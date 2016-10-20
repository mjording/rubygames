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
    reverse_hashroman = HASHROMAN.invert
    reverse_hashroman_keys = reverse_hashroman.keys.sort.reverse
    working_decimal = decimal
    working_roman = ''
    reverse_hashroman_keys.each{|key|
      (working_decimal / key).times {
        working_roman << "#{reverse_hashroman[key]}"
        working_decimal -= key
      }
    }
    working_roman
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

  def -( other_roman )
    dec_num = decimal_val - other_roman.decimal_val
    RomanNumeral.romanize(dec_num)
  end
end


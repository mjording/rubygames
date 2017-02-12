require 'spec_helper'
require 'roman_numeral'

describe RomanNumeral do
  it 'should compute simple arithmatic' do
  	# 1996 plus 14 equals 2010
      expect( RomanNumeral.new( 'MCMXCVI' ) + RomanNumeral.new( 'XIV' ) ).to eq('MMX')

  	# 2010 minus 14 equals 1996
      expect( RomanNumeral.new( 'MMX' ) - RomanNumeral.new( 'XIV' ) ).to eq('MCMXCVI')

      # 1996 minus 1996 equals -14
      expect( RomanNumeral.new( 'MCMXCVI' ) - RomanNumeral.new( 'MMX' ) ).to eq('-XIV')

      # 23 times 11 equals 253
      expect( RomanNumeral.new( 'XXIII' ) * RomanNumeral.new( 'XI' ) ).to eq('CCLIII')

      # 253 divided by 11 equals 23
      expect( RomanNumeral.new( 'CCLIII' ) / RomanNumeral.new( 'XI' ) ).to eq('XXIII')

      # 100 divided by 33 equals 3.  The romans had a complicated fraction system, we're not going there.
      expect( RomanNumeral.new( 'C' ) / RomanNumeral.new( 'XXXIII' ) ).to eq('III')
  end
end
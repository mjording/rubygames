require 'spec_helper'
require 'roman_numeral'


describe RomanNumeral do

  it 'should compute simple arithmatic' do
    @reports << Benchmark.measure do
      expect( RomanNumeral.new( 'MCMXCVI' ) + RomanNumeral.new( 'XIV' ) ).to be('MMX')
      expect( RomanNumeral.new( 'MMX' ) + RomanNumeral.new( 'XIV' ) ).to be('MCMXCVI')
    end
  end

end

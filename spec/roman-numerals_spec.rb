require 'helper'

describe RomanNumerals do

  describe ".to_roman" do

    described_class::BASE_DIGITS.each do |decimal, roman|
      it "converts the decimal value #{decimal} to the roman value #{roman}" do
        described_class.to_roman(decimal).should == roman
      end
    end

    it "converts larger decimals" do
      described_class.to_roman(23234).should == 'MMMMMMMMMMMMMMMMMMMMMMMCCXXXIV'
      described_class.to_roman(42).should == 'XLII'
    end

  end

  describe ".to_decimal" do

    described_class::BASE_DIGITS.each do |decimal, roman|
      it "converts the roman value #{roman} to the decimal value #{decimal}" do
        described_class.to_decimal(roman).should == decimal
      end
    end

    it "converts larger roman numerals" do
      described_class.to_decimal('MMMMMMMMMMMMMMMMMMMMMMMCCXXXIV').should == 23234
      described_class.to_decimal('XLII').should == 42
    end

    it "handles lower-case roman numerals" do
      described_class.to_decimal('mmmmmmmmmmmmmmmmmmmmmmmccxxxiv').should == 23234
      described_class.to_decimal('xlii').should == 42
    end

    it "should return nil for bad numerals" do
      described_class.to_decimal('OST').should be_nil
    end

  end

  describe ".valid_numeral_set?" do

    it "should be valid for all bases" do
      described_class::BASE_DIGITS.each do |decimal, roman|
        described_class.should be_valid_numeral_set roman
      end
    end

    it "should be valid combinations" do
      described_class.should be_valid_numeral_set "XXIII"
      described_class.should be_valid_numeral_set "IIX"
      described_class.should be_valid_numeral_set "MMXIII"
    end

    it "should be valid for bad combos" do
      described_class.should_not be_valid_numeral_set "OST"
      described_class.should_not be_valid_numeral_set "DVNO"
      described_class.should_not be_valid_numeral_set "CJ"
    end

  end
end

module RomanNumerals
  BASE_DIGITS = {
    1    => 'I',
    4    => 'IV',
    5    => 'V',
    9    => 'IX',
    10   => 'X',
    40   => 'XL',
    50   => 'L',
    90   => 'XC',
    100  => 'C',
    400  => 'CD',
    500  => 'D',
    900  => 'CM',
    1000 => 'M'
  }

  def self.to_roman(value)
    result = ''
    BASE_DIGITS.keys.reverse.each do |decimal|
      while value >= decimal
        value -= decimal
        result += BASE_DIGITS[decimal]
      end
    end
    result
  end

  def self.to_decimal(value)
    value.upcase!
    return nil unless valid_numeral_set? value
    result = 0
    BASE_DIGITS.values.reverse.each do |roman|
      while value.start_with? roman
        value = value.slice(roman.length, value.length)
        result += BASE_DIGITS.key roman
      end
    end
    result
  end

  def self.valid_numeral_set?(str)
    str.chars.to_a.all? do |char|
      BASE_DIGITS.values.any? { |v| char == v }
    end
  end
end
